//
//  BaseViewController.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import Foundation
import UIKit


protocol BaseView: class {
    func showLoader()
    func hideLoader()
}

class BaseViewController: UIViewController, BaseView {
    
    
   
    
    //MARK:- ViewController's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Functions
    func settingNavBar(){
        
    }
    
    func showLoader() {
        
    }
    func hideLoader() {
        
    }
    
    
    
    
}

