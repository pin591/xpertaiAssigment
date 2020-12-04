//
//  MovieListRepositoryProtocol.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

protocol MovieListRepositoryProtocol {
    var datasource: FakeMovieListDataSourceProtocol? { get set}
    func getMovieAtIndex(index: Int) -> Movie?
    func getMoviesNumber() -> Int?
}
