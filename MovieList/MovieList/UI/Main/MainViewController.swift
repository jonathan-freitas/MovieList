//
//  ViewController.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit
import TMDBSwift

class MainViewController: UIViewController {

    // MARK: - Variables
        
    var viewModel: MainViewModel?
    var tableView: UITableView = UITableView()
    let moviesDataSource: MoviesDataSource = MoviesDataSource()
    
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(viewModel: MainViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel?.viewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    // MARK: - Methods
    
    private func getUpcomingMovies(page: Int = 1) {
        viewModel?.upcomingMovies(page: page)
    }
    
    private func setupViews() {
        title = "Upcoming Movies!"
        configTableView()
    }
    
    private func configTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.register(UINib(nibName: "MovieSkeletonTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieSkeletonTableViewCell")
    
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = moviesDataSource
        tableView.contentInset.bottom = 100
        
        // Starting point
        getUpcomingMovies()
    }
}

extension MainViewController: MainViewDelegate {
    func upcomingMovies(_ movies: [MovieMDB]) {
        
        moviesDataSource.movies += movies
        moviesDataSource.shouldShowSkeleton = false
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yay")
    }
}

class MoviesDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Variables
    
    let cellHeight: CGFloat = 130

    var skeletonCount: Int = 12
    var shouldShowSkeleton: Bool = true
    var movies: [MovieMDB] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSkeleton {
            return skeletonCount
        } else {
            return movies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if shouldShowSkeleton {
            let cell: MovieSkeletonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieSkeletonTableViewCell", for: indexPath) as! MovieSkeletonTableViewCell
            return cell
        }
        
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.viewModel = MovieItemViewModel(movie: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
