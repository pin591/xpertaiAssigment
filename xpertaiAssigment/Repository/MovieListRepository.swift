//
//  MovieListRepository.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class MovieListRepository: MovieListRepositoryProtocol {
    
    var datasource: ApiMovieListDatasourceProtocol?

    func getMovieAtIndex(index: Int) -> Movie? {
       return datasource?.getMovieAtIndex(index: index)
    }

    func getMoviesNumber() -> Int? {
        return datasource?.getMoviesNumber()
    }
}
