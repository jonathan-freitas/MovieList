//
//  MovieSkeletonTableViewCell.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import UIKit
import SkeletonView

class MovieSkeletonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        for sbView in contentView.subviews {
            sbView.alpha = 1
        }
        
        if !contentView.isSkeletonActive {
            contentView.showAnimatedGradientSkeleton()
        }
    }
}
