//
//  HomeViewController.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: - IBActions
    @IBAction func goToListMovies() {
        Router.presentMainView(viewcontroller: self)
    }
    
}
