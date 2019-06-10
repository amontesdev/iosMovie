//
//  ListTopViewModel.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

protocol ListTopViewModelView: BaseView{
    func retrieveInfoView(info: ListTopCellResponse)
    func noData()
}

protocol ListTopViewModelDelegate{
    func viewDidLoad()
}

class ListTopViewModel: ListTopViewModelDelegate{
    weak var view: ListTopViewModelView?
    var listTopService: ListTopService?
    init(view: ListTopViewModelView, listTopService: ListTopService?) {
        self.view = view
        self.listTopService = listTopService
    }
    
    func viewDidLoad() {
        requestInfoView()
    }
    private func requestInfoView(){
        self.listTopService?.getTopMovies(completion: {[weak self] (response, error) in
            if let safeResponse = response{
                self?.view?.retrieveInfoView(info: safeResponse)
            }else{
                self?.view?.noData()
            }
        })
    }
    
}
