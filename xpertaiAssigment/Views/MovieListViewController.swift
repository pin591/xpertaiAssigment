//
//  MovieListViewController.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 03/12/2020.
//

import UIKit

class MovieListViewController: UIViewController, MovieListViewProtocol {

    var presenter: MovieListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
    }
}
