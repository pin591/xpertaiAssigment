//
//  MovieListDatasource.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class FakeMovieListDatasource: FakeMovieListDataSourceProtocol {
    var movies = [Movie]()
    
    init() {
        let movie1 = Movie(title: "Harry Potter", year: "2020", rate: 4.0, posterImage: "cover1", overview: "Harry potter overview")
        let movie2 = Movie(title: "Star wars", year: "1990", rate: 3.0, posterImage: "cover2", overview: "Star wars overview")
        let movie3 = Movie(title: "Pretty woman ", year: "1995", rate: 3.0, posterImage: "cover3", overview: "Pretty woman overview")
        let movie4 = Movie(title: "Matrix", year: "2020", rate: 2.0, posterImage: "cover4", overview: "Matrix overview")

        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)
        movies.append(movie4)
    }

    func getMovieAtIndex(index: Int) -> Movie? {
        return movies[index]
    }

    func getMoviesNumber() -> Int? {
        return movies.count
    }
}
