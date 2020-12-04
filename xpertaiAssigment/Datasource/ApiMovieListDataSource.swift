//
//  ApiMovieListDataSource.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class ApiMovieListDataSource: ApiMovieListDatasourceProtocol {
    
    var movies = [Movie]()

    var dataTask: URLSessionDataTask?
    let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page=1"
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)

    init() {
        downloadJSONFromURL()
    }

    func downloadJSONFromURL() {
        if dataTask != nil {
            dataTask?.cancel()
        }

        if let url = URL(string: popularMoviesURL) {
            let request = URLRequest(url: url)
            dataTask = session.dataTask(with: request) {(data, response,error) in
                if error == nil {
                    if let httpResponse = response as? HTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200:
                            if let data = data {
                                do {
                                    let callResult = try JSONDecoder().decode(Movies.self, from: data)
                                    for movie in callResult.movies {
                                        self.mapDTOInModel(movie: movie)
                                    }
                                } catch let error as NSError {
                                    print ("Error processing json data: \(error.description)")
                                }
                            }
                        default:
                            print("HTTP Response Code: \(httpResponse.statusCode)")
                        }
                    }
                } else {
                    print("Error: \(String(describing: error?.localizedDescription))")
                }
            }
            dataTask?.resume()
        }
    }

    func mapDTOInModel(movie: Movie) {
        let currentMovie = Movie(title: movie.title,
                                 year: movie.year,
                                 rate: movie.rate,
                                 posterImage: movie.posterImage,
                                 overview: movie.overview)

        self.movies.append(currentMovie)
    }
    
    func getMovieAtIndex(index: Int) -> Movie? {
        return movies[index]
    }

    func getMoviesNumber() -> Int? {
        return movies.count
    }
}
