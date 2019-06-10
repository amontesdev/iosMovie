//
//  ListPopularViewModel.swift
//  iOSPeiky
//
//  Created by user156150 on 6/8/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

protocol ListPopularViewModelView: BaseView{
    func retrieveInfoView(info: ListPopularCellResponse)
    func noData()
}

protocol ListPopularViewModelDelegate{
    func viewDidLoad()
}

class ListPopularViewModel: ListPopularViewModelDelegate{
    weak var view: ListPopularViewModelView?
    var listPopularService: ListPopularService?
    init(view: ListPopularViewModelView, listPopularService: ListPopularService?) {
        self.view = view
        self.listPopularService = listPopularService
    }
    
    func viewDidLoad() {
        requestInfoView()
    }
    private func requestInfoView(){
        self.listPopularService?.getPopularMovies(completion: {[weak self] (response, error) in
            if let safeResponse = response{
                self?.view?.retrieveInfoView(info: safeResponse)
            }else{
                self?.view?.noData()
            }
        })
    }
    
}
