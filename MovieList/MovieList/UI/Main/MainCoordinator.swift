//
//  MainCoordinator.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit

protocol MainCoordinatorDelegate {
    func viewDetails(movieID: Int)
}

class MainCoordinator: Coordinator {

    // MARK: - Variables
    var window: UIWindow
    var mainViewModel: MainViewModel?
    var mainViewController: MainViewController?
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        mainViewModel = MainViewModel(viewDelegate: self)
        mainViewController = MainViewController(viewModel: mainViewModel!)
        window.rootViewController = mainViewController
    }
    
    func stop() {
        mainViewModel = nil
        mainViewController = nil
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func viewDetails(movieID: Int) {
        print("yay")
    }
}
