//
//  CountriesTableViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 29/05/2024.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    private var countryList = ["Abu Dhabi", "San Antonio", "US"]
    private var countryImages = ["AbuDhabi.png", "SanAntonio.png", "US.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.reuseIdentifier)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CountryTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(
            with: countryList[indexPath.row],
            image: countryImages[indexPath.row]
        )
        return cell
    }
    
}
