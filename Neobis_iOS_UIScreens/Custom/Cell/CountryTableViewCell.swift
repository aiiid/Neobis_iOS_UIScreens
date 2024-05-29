//
//  CountryCardTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 29/05/2024.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CountryTableViewCell"
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private var countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // Ensure the image is properly scaled
        imageView.clipsToBounds = true // Ensure the image doesn't overflow the bounds
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(countryImage)
        contentView.addSubview(countryLabel)
        
        countryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
        countryImage.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
            make.height.equalTo(250)
        }
    }
    
    func configure(with country: String, image: String) {
        countryLabel.text = country
        countryImage.image = UIImage(named: image)
    }
    
}
