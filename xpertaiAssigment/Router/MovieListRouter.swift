//
//  MovieListRouter.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 04/12/2020.
//

import Foundation
import UIKit

class MovieListRouter: MovieListProtocol {

  static func createModule() -> MovieListViewController {

        let view = MovieListViewController()
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor()
        let repository = MovieListRepository()
        let datasource = FakeMovieListDatasource()

        view.presenter = presenter
        presenter.interactor = interactor
        interactor.repository = repository
        repository.datasource = datasource
        return view
    }
}
