//
//  PortfolioAsset.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 30/05/2024.
//

import UIKit
import SnapKit

class PortfolioAssetCell: UITableViewCell {
    static let reuseIdentifier = "AssetCell"
    
    private let assetImageContainer = UIView()
    private var assetImage = UIImageView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var percentageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .secondaryLabel
        return label
    }()
    
    let leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let rightStackView: UIStackView = {
            let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(assetImageContainer)
        assetImageContainer.addSubview(assetImage)
        
        leftStackView.addArrangedSubview(titleLabel)
        leftStackView.addArrangedSubview(percentageLabel)
        
        rightStackView.addArrangedSubview(priceLabel)
        rightStackView.addArrangedSubview(quantityLabel)
        
        contentView.addSubview(leftStackView)
        contentView.addSubview(rightStackView)
        
        assetImageContainer.layer.cornerRadius = 20
        assetImageContainer.clipsToBounds = true
        
        assetImageContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(28)
            make.width.height.equalTo(56)
        }
        
        // Configure the image inside the container
        assetImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(22)
        }
        
        leftStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(assetImageContainer.snp.trailing).offset(12)
        }
        
        rightStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-28)
        }
    }
    
    func configure(with asset: CryptoAsset) {
        titleLabel.text = asset.name
        assetImage.image = UIImage(named: asset.image)
        percentageLabel.text = asset.percentage
        priceLabel.text = String(asset.price)
        quantityLabel.text = String(asset.quantity)
        
        assetImageContainer.backgroundColor = UIColor(hex: asset.background, alpha: 0.3)
    }
   
}
