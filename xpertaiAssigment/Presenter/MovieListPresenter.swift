//
//  MovieListPresenter.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

class MovieListPresenter: MovieListPresenterProtocol {
    var interactor: MovieListInteractorProtocol?

    func getMovieAtIndex(index: Int) -> Movie? {
        return interactor?.getMovieAtIndex(index: index)
    }

    func getMoviesNumber() -> Int? {
        return interactor?.getMoviesNumber()
    }
}
