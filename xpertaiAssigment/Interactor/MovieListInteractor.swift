//
//  MovieListInteractor.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class MovieListInteractor: MovieListInteractorProtocol {
    
    var repository: MovieListRepositoryProtocol?

    func getMovieAtIndex(index: Int) -> Movie? {
        return repository?.getMovieAtIndex(index: index)
    }

    func getMoviesNumber() -> Int? {
        return repository?.getMoviesNumber()
    }
}
