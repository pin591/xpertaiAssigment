//
//  MovieListViewProtocol.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation

protocol MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol? { get set }
    
    func reloadview()
}
