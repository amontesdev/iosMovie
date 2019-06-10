//
//  MainViewController.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTabBar()
    }
    
    //MARK: - Functions
    func injectDependeciesToPopularViewModel(){
        let popularTab = PopularViewController()
        let service : ListPopularService? = ServiceLocator.sharedInstance.get(service: ListPopularService.self)
        popularTab.viewModel = ListPopularViewModel(view: popularTab, listPopularService: service)
        
        
    }
    func settingTabBar(){
        //First Tab
        let PopularTab = PopularViewController()
        let service : ListPopularService? = ServiceLocator.sharedInstance.get(service: ListPopularService.self)
        PopularTab.viewModel = ListPopularViewModel(view: PopularTab, listPopularService: service)
        PopularTab.tabBarItem =  UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        
        //Second Tab
        let topTab = TopMoviesViewController()
        let serviceTop : ListTopService? = ServiceLocator.sharedInstance.get(service: ListTopService.self)
        topTab.viewModel = ListTopViewModel(view: topTab, listTopService: serviceTop)
        topTab.tabBarItem =  UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        //Third Tab
        let upTab = UpViewController()
        let serviceUp : ListUpService? = ServiceLocator.sharedInstance.get(service: ListUpService.self)
        upTab.viewModel = ListUpViewModel(view: upTab, listUpService: serviceUp)
        upTab.tabBarItem =  UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        viewControllers = [PopularTab,topTab, upTab]
        hidesBottomBarWhenPushed = true
    }

}
