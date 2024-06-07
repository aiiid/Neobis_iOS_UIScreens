//
//  WalletHeaderView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 02/06/2024.
//

import UIKit
import SnapKit

class WalletHeaderView: UIView {
    private let monthView = MonthView()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        let balance = Int.random(in: 50000...100000)
        label.text = "$\(balance)"
        
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let balanceView = UIView()
        balanceView.addSubview(descriptionLabel)
        balanceView.addSubview(balanceLabel)
        
        verticalStack.addArrangedSubview(balanceView)
        verticalStack.addArrangedSubview(monthView)
        addSubview(verticalStack)
        
        balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        balanceView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStack)
            make.height.equalTo(100)
        }
        
        monthView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(10)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        
    }
}
