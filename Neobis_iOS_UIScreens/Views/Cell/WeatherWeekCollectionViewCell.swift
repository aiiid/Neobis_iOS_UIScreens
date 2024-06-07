//
//  WeatherWeekCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import UIKit

class WeatherWeekCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "weatherWeekCollectionViewCell"
    
    var cellData: WeatherWeekModel? {
        didSet {
            guard let cellData = cellData else { return }
            weatherIcon.image = UIImage(systemName: cellData.icon)
            degreeLabel.text = cellData.degree
            dayLabel.text = cellData.day
        }
    }
    
    private var weatherIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private var degreeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private var dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let horizontalStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.distribution = .equalSpacing
            return stackView
        }()
        
        horizontalStackView.addArrangedSubview(degreeLabel)
        horizontalStackView.addArrangedSubview(weatherIcon)
        horizontalStackView.addArrangedSubview(dayLabel)
        
        addSubview(horizontalStackView)
        
        weatherIcon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(37)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
