//
//  TravelViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 28/05/2024.
//

import UIKit

class TravelViewController: UIViewController {
    private let travelHeader = TravelHeaderView()
    private let countryTableView = CountriesTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(travelHeader)
        view.addSubview(countryTableView.view)
        
        travelHeader.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        countryTableView.view.snp.makeConstraints { make in
            make.top.equalTo(travelHeader.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
