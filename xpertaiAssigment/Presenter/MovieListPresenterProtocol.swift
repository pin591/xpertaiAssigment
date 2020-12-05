//
//  MovieListPresenterProtocol.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

protocol MovieListPresenterProtocol {
    
    var interactor: MovieListInteractorProtocol? { get set }
    var view: MovieListViewProtocol? { get set }

    func getMovieAtIndex(index: Int) -> Movie?
    func getMoviesNumber() -> Int?
    func reloadview()
}
