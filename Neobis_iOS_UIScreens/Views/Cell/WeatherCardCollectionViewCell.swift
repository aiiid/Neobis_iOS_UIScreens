//
//  WeatherCardCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import UIKit
import SnapKit

class WeatherCardCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "weatherCardCollectionViewCell"
    
    var cellData: WeatherDayModel? {
        didSet {
            guard let cellData = cellData else { return }
            weatherIcon.image = UIImage(systemName: cellData.icon)
            degreeLabel.text = cellData.degree
            timeLabel.text = cellData.time
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
    
    private var timeLabel: UILabel = {
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
        let verticalStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.distribution = .equalSpacing
            return stackView
        }()
        
        verticalStackView.addArrangedSubview(degreeLabel)
        verticalStackView.addArrangedSubview(weatherIcon)
        verticalStackView.addArrangedSubview(timeLabel)
        
        addSubview(verticalStackView)
        
        weatherIcon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(37)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
