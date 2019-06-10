//
//  ListUpViewModel.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

protocol ListUpViewModelView: BaseView{
    func retrieveInfoView(info: ListUpCellResponse)
    func noData()
}

protocol ListUpViewModelDelegate{
    func viewDidLoad()
}

class ListUpViewModel: ListUpViewModelDelegate{
    weak var view: ListUpViewModelView?
    var listUpService: ListUpService?
    init(view: ListUpViewModelView, listUpService: ListUpService?) {
        self.view = view
        self.listUpService = listUpService
    }
    
    func viewDidLoad() {
        requestInfoView()
    }
    private func requestInfoView(){
        self.listUpService?.getUpMovies(completion: {[weak self] (response, error) in
            if let safeResponse = response{
                self?.view?.retrieveInfoView(info: safeResponse)
            }else{
                self?.view?.noData()
            }
        })
    }
    
}
