//
//  MovieListViewController.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 03/12/2020.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController, MovieListViewProtocol, UITableViewDelegate, UITableViewDataSource  {

    var presenter: MovieListPresenterProtocol?
    let tableView = UITableView()
    let cellId = "movieCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getMoviesNumber() ?? 0
        //return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let movie = presenter?.getMovieAtIndex(index: indexPath.row)
        cell.textLabel?.text = movie?.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = presenter?.getMovieAtIndex(index: indexPath.row)
        NSLog("You selected cell : \(String(describing: movie?.title))")
    }
}
