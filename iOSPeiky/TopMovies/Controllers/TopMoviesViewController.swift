//
//  TopMoviesViewController.swift
//  iOSPeiky
//
//  Created by user156150 on 6/9/19.
//  Copyright © 2019 Andres Montes. All rights reserved.
//

import UIKit

class TopMoviesViewController: BaseViewController {
    //MARK: - IBOultes and Vars
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var viewModel : ListTopViewModel?
    private var listMovies : ListTopCellResponse?
    static let cellsNibName =  "ListTopTableViewCell"
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavBar()
        settingTableView()
        self.viewModel?.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Functions
    private func settingTableView() {
        tableView.register(UINib(nibName: TopMoviesViewController.cellsNibName, bundle: nil), forCellReuseIdentifier: ListTopTableViewCell.reuseIdentifier)
    }
    override func settingNavBar() {
        self.parent?.title = "Top Rated"
    }
    override func hideLoader() {
        loading.stopAnimating()
    }
}

//MARK: - Extensions

extension TopMoviesViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTopTableViewCell.reuseIdentifier) as?  ListTopTableViewCell, let movies = listMovies?.results?[indexPath.row] else{
            fatalError()
        }
        cell.settings = ListTopCellModels(movies: movies)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieName = listMovies?.results?[indexPath.row].title
        let movieOver = listMovies?.results?[indexPath.row].overview
        let movieImageUrl = listMovies?.results?[indexPath.row].backdrop_path
        let detailVc = DetailMovieViewController()
        detailVc.filmName = movieName!
        detailVc.filmOver = movieOver!
        detailVc.filmImage = movieImageUrl!
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
}

extension TopMoviesViewController : ListTopViewModelView{
    
    
    func retrieveInfoView(info: ListTopCellResponse) {
        self.listMovies = info
        tableView.reloadData()
        hideLoader()
    }
    
    func noData() {
        print("no data")
    }
    
    
    
}
