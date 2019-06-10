//
//  ListUpBuilder.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class ListUpBuilder: ObjectBuilder{
    var builder: Builder?
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func build<T>(from dictionary: [[String : Any]]?) -> T? {
        var listUpResponse = ListUpCellResponse()
        if let listUpArray = dictionary! as? [[String:Any]]{
            var upMovies = [ListUpModel]()
            listUpArray.forEach{(item) in
                var movie = ListUpModel()
                movie.adult = item["adult"] as! Bool
                movie.backdrop_path = item["backdrop_path"] as! String
                movie.genre_ids = item["genre_ids"] as! [Int]
                movie.id = item["id"] as! Int
                movie.original_language = item["original_language"] as! String
                movie.original_title = item["original_title"] as! String
                movie.overview = item["overview"] as! String
                movie.popularity = item["popularity"] as! Double
                movie.poster_path = item["poster_path"] as! String
                movie.release_date = item["release_date"] as! String
                movie.title = item["title"] as! String
                movie.video = item["video"] as! Bool
                movie.vote_average = item["vote_average"] as! Double
                movie.vote_count = item["vote_count"] as! Int
                
                upMovies.append(movie)
                
            }
            listUpResponse.results = upMovies
            
        }
        return listUpResponse as? T
        
    }

}
