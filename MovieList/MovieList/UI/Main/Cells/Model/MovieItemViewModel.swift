//
//  MovieItemCellModel.swift
//  MovieList
//
//  Created by Jonathan Freitas Ferreira on 31/01/20.
//  Copyright © 2020 Jonathan Freitas Ferreira. All rights reserved.
//

import Foundation
import TMDBSwift

struct MovieItemViewModel {
    
    let movie: MovieMDB
    
    var title: String {
        return movie.title ?? "TITULO"
    }
    
    var description: String {
        return movie.overview ?? "DESCRICAO"
    }
    
    var genre: String {
        return movie.genres[0].name ?? "GENERO"
    }
    
    var releaseDate: String {
        return movie.release_date ?? "DATA DE LANCAMENTO"
    }
    
}
