//
//  MovieListInteractorProtocol.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

protocol MovieListInteractorProtocol {
    
    var repository: MovieListRepositoryProtocol? { get set}
    
    func getMovieAtIndex(index: Int) -> Movie?
    func getMoviesNumber() -> Int?

}
