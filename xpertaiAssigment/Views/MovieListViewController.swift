//
//  MovieListViewController.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 03/12/2020.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController, MovieListViewProtocol {

    var presenter: MovieListPresenterProtocol?
    let tableView = UITableView()

    override func loadView() {
        super.loadView()
        setupTableViewContrains()
    }
    
    func setupTableViewContrains() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
