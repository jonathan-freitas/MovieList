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
    }

}

extension MainViewController: MainViewDelegate {
    func upcomingMovies(_ movies: [MovieMDB]) {
        print("yay")
    }
}

