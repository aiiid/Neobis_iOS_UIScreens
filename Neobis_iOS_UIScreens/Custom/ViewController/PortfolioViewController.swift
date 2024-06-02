//
//  PortfolioViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 28/05/2024.
//

import UIKit
import SnapKit

class PortfolioViewController: UIViewController {
    let portfolio = PortfolioTableView()
    
    let viewMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("View More", for: .normal)
        button.setTitleColor(.magenta, for: .normal) // You can set any color you want
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(portfolio)
        view.addSubview(viewMoreButton)
        
        title = "Портфолио"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem?.tintColor = UIColor.gray
        
        viewMoreButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(3)
            make.trailing.equalToSuperview().offset(-20)
        }
        portfolio.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(viewMoreButton.snp.bottom).offset(5)
        }
    }
}
