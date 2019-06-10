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
    let filmName = UserDefaults.standard.string(forKey: "movieName")
    let filmImage = UserDefaults.standard.string(forKey: "movieImageUrl")
    let filmOver = UserDefaults.standard.string(forKey: "movieOver")
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieData()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    
    func setMovieData(){
        self.movieName.text = self.filmName ?? ""
        self.overviewMovie.text = self.filmOver ?? ""
        do {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmImage!)")
            let data = try Data(contentsOf: url!)
            self.imageMovie.image = UIImage(data: data)
        }
        catch{
            print(error)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
