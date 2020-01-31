//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    var viewModel: MovieItemViewModel? = nil {
        didSet {
            bindUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func bindUI() {
        
    }
}
