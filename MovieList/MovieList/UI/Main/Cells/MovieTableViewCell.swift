//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Model
    
    var viewModel: MovieItemViewModel? = nil {
        didSet {
            bindUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func bindUI() {
        titleLabel.text = viewModel?.title
        descLabel.text = viewModel?.description
        genreLabel.text = viewModel?.genre
        dateLabel.text = viewModel?.releaseDate
        
        // TODO: Request Poster
        
    }
}
