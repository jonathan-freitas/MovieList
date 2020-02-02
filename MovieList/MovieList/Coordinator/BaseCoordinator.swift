//
//  BaseCoordinator.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import Foundation
import UIKit

/// PresentationType
///
/// - push: push for navigationController
/// - modal: present for viewController
enum PresentationType {
    case push(navigationController: UINavigationController)
    case modal(viewController: UIViewController)
    
    func associatedValue() -> Any? {
        switch self {
        case .push(let value):
            return value
        case .modal(let value):
            value.modalPresentationStyle = .fullScreen
            return value
        }
    }
}

/// Protocol Base Coordninator
protocol BaseCoordinator: AnyObject {
    
    /// Associated type of UIViewController for start coordinator
    associatedtype V: UIViewController
    
    /// View for start coordinator
    var view: V? { get set }
    
    /// Navigation Controller
    var navigation: UINavigationController? { get set }
    
    /// Presentation type for start your coordinator
    var presentationType: PresentationType? { get set }
    
    /// Start coordinator with return UIViewController
    ///
    /// - Returns: return view
    func start() -> V
    
    /// Start coordinator with presentation type
    ///
    /// - Parameter presentation: PresentationType that can be push or modal
    func start(usingPresentation presentation: PresentationType)
    
    /// Stop all properties stored in your coordinator
    func stop()
}
