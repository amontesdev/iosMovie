//
//  Router.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class Router:NSObject {
    
    private static var window: UIWindow? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.window
    }
    
    static func presentMainView(viewcontroller:UIViewController){
        let mainView = MainViewController()
        viewcontroller.navigationController?.pushViewController(mainView, animated: true)
        
    }
}
