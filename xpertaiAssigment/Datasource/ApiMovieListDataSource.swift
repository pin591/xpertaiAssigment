//
//  ApiMovieListDataSource.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class ApiMovieListDataSource: ApiMovieListDatasourceProtocol {
    
    var repository: MovieListRepositoryProtocol?
    
    var movies = [Movie]()
    var page = 1
    
    var dataTask: URLSessionDataTask?
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)

    init() {
        fetchmovies()
    }

    func fetchmovies() {
        if dataTask != nil {
            dataTask?.cancel()
        }
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page=\(page)"

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
        repository?.reloadview()

    }

    func isPaginationNeeded(indexpath : Int) -> Bool {
           if indexpath == movies.count - 1 {
               return true
           }
           return false
       }

       func loadNewPage() {
           page += 1
       }

    func getMovieAtIndex(index: Int) -> Movie? {

        if isPaginationNeeded(indexpath: index) {
            loadNewPage()
            fetchmovies()
        }
        return movies[index]
    }

    func getMoviesNumber() -> Int? {
        return movies.count
    }
}
