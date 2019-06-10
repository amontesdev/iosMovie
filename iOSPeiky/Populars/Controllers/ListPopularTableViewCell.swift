//
//  ListPopularTableViewCell.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class ListPopularTableViewCell: UITableViewCell {
    
    //IBOulets and vars
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    static let reuseIdentifier = "ListPopularTableViewCellId"
    
    
    
    //Mark: -Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Mark: -Settings
    var settings:ListPopularCellModels?{
        
        didSet{
            guard let setting = settings else{
                return
            }
            movieName.text = setting.movieName
            
            do {
                let url = URL(string: "https://image.tmdb.org/t/p/w500\(setting.urlMovieImage)")
                let data = try Data(contentsOf: url!)
                self.movieImage.image = UIImage(data: data)
            }
            catch{
                print(error)
            }
        }
    }
    
}
