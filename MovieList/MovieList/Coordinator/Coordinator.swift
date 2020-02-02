//
//  Coordinator.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var window: UIWindow { get set }

    init(window: UIWindow)

    func start()
}
