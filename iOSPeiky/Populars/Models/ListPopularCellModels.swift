//
//  ListPopularCellModels.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

class ListPopularCellModels {
    var movieName:String
    var urlMovieImage:String
    
    init(movies: ListPopularModel) {
        self.movieName = movies.title ?? ""
        self.urlMovieImage = movies.poster_path ?? ""
        
    }
}

