//
//  MovieListViewController.swift
//  xpertaiAssigment
//
//  Created by Ana Rebollo Pin on 03/12/2020.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController, MovieListViewProtocol, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate  {
  
    var presenter: MovieListPresenterProtocol?
    let tableView = UITableView()
    let cellId = "movieCell"
    var selectedCells = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 600
        setupTableView()
    }

    func setupTableView() {
        tableView.register(MovieCustomCell.self, forCellReuseIdentifier: cellId)
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
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MovieCustomCell {
            let movie = presenter?.getMovieAtIndex(index: indexPath.row)
            cell.setupCell(movie: movie)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = presenter?.getMovieAtIndex(index: indexPath.row)
        if let selectedMovie = movie?.title {
            selectedCells.insert(contentsOf: selectedMovie, at: selectedCells.endIndex)
            selectedCells.insert(contentsOf: ", ", at: selectedCells.endIndex)
        }
        
        var popUpViewController: PopUpWiewController!
        popUpViewController = PopUpWiewController(title: "Selected Items", text: selectedCells, buttontext: "OK")
        self.present(popUpViewController, animated: true, completion: nil)
        NSLog("\(String(describing: selectedCells))")
    }
    
    func reloadview() {
        DispatchQueue.main.async { [unowned self] in
            tableView.reloadData()
        }
    }
}
