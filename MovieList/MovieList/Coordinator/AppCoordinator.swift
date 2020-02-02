//
//  AppCoordinator.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Variables
    var window: UIWindow
    var mainCoordinator: MainCoordinator?
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        // Show First Screen
        mainCoordinator = MainCoordinator(window: self.window)
        mainCoordinator?.start()
    }
}
