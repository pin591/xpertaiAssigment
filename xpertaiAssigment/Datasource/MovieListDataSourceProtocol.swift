//
//  MovieListDataSourceProtocol.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

protocol Fake {
    func getMovieAtIndex(index: Int) -> Movie?
    func getMoviesNumber() -> Int?
}
