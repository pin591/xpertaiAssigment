//
//  MovieListDatasource.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class MovieListDatasource: MovieListDataSourceProtocol {
    var movies = [Movie]()

    func getMovieAtIndex(index: Int) -> Movie? {
        return movies[index]
    }

    func getMoviesNumber() -> Int? {
        return movies.count
    }
}
