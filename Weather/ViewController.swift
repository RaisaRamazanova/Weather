//
//  ViewController.swift
//  Weather
//
//  Created by Пользователь on 13.08.2020.
//  Copyright © 2020 Raisat Ramazanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource {
    
    var timer = Timer()
    var dataIsReady:Bool = false
    var offerModel:OfferModel! {
        didSet {
            self.contentView.tableView.reloadData()
        }
    }
    
    fileprivate var contentView: MainView {
        return self.view as! MainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        (self.view as! MainView).tableView.dataSource = self
    }
        
    fileprivate func setupNavigationBar() {
        self.navigationItem.title = "Weather Application"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        timer.invalidate()
        
        if city.count > 1 {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
                NetworkManager.shared.getWeather(city: city, result: { (model) in
                    if model != nil {
                        self.dataIsReady = true
                        self.offerModel = model
                    }
                })
            })
        }
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataIsReady {
        return self.offerModel!.weather!.count
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell")  as! CustomTableViewCell
    
        cell.cityLabel.text = self.offerModel.name
        cell.timeLabel.text = self.offerModel!.timezone
        cell.minTempLabel.text = self.offerModel.main.temp_min!.description
        cell.maxTempLabel.text = self.offerModel.main.temp_max!.description
        cell.tempLabel.text = self.offerModel.main.temp!.description
        
        
        return cell
    }
}
