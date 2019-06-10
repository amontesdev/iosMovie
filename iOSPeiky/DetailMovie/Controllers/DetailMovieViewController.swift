//
//  DetailMovieViewController.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    //MARK: - IBOulets and Vars
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var overviewMovie: UILabel!
    var filmName = ""
    var filmImage = ""
    var filmOver = ""
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieData()
    }
    //MARK: - Functions
    
    func setMovieData(){
        self.movieName.text = self.filmName ?? ""
        self.overviewMovie.text = self.filmOver ?? ""
        do {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmImage)")
            let data = try Data(contentsOf: url!)
            self.imageMovie.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
    }
}
