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
        let datasource = ApiMovieListDataSource()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.datasource = datasource
        datasource.repository = repository
        return view
    }
}
