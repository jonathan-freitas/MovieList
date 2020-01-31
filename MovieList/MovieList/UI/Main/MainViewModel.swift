//
//  MainViewModel.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import Foundation
import TMDBSwift

protocol MainViewDelegate {
    func upcomingMovies(_ movies: [MovieMDB])
}

class MainViewModel {

    // MARK: - Variables
    let coordinatorDelegate: MainCoordinatorDelegate
    var viewDelegate: MainViewDelegate?
    
    init(viewDelegate: MainCoordinatorDelegate) {
        TMDBConfig.apikey = "c5850ed73901b8d268d0898a8a9d8bff"
        coordinatorDelegate = viewDelegate
    }
    
    func upcomingMovies(page: Int, language: String = "en") {
        MovieMDB.upcoming(page: page, language: language) { data, upcomingMovies in
            guard let movies = upcomingMovies else { return }
            self.viewDelegate?.upcomingMovies(movies)
        }
    }
    
    func viewMovieDetails(movieID: Int) {
        coordinatorDelegate.viewDetails(movieID: movieID)
    }
}
