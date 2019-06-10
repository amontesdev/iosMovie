//
//  ListUpTableViewCell.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class ListUpTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    static let reuseIdentifier = "ListUpTableViewCellId"
    
    
    
    //Mark: -Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Mark: -Settings
    var settings:ListUpCellModels?{
        
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
