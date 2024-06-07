//
//  WalletViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 28/05/2024.
//

import UIKit
import SnapKit

class WalletViewController: UIViewController {
    private let walletHeaderView = WalletHeaderView()
    private let portfolioTableView = PortfolioTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(walletHeaderView)
        view.addSubview(portfolioTableView)
        
        walletHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        portfolioTableView.snp.makeConstraints { make in
            make.top.equalTo(walletHeaderView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
