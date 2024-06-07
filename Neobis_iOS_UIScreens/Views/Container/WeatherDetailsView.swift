//
//  weatherDetailsView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 06/06/2024.
//

import UIKit
import SnapKit

class WeatherDetailsView: UIView {
    
    private var weatherState: WeatherState = .sunny
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI(for: nil, with: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(for weather: WeatherState?, with detail: String?) {
        guard let weather = weather else { return }
        
        let weatherLabel = UILabel()
        
        weatherLabel.text = weather.description
        weatherLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        weatherLabel.textAlignment = .left
        weatherLabel.textColor = .white
        
        let weatherIcon = UIImageView()
        weatherIcon.image = UIImage(systemName: weather.iconName)
        weatherIcon.tintColor = .white
        weatherIcon.contentMode = .scaleAspectFit
        
        let weatherDetail = UILabel()
        weatherDetail.text = detail
        weatherDetail.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        weatherDetail.textColor = .white
        
        let divider: UILabel = {
            let label = UILabel()
            label.text = "|"
            label.textColor = .white
            return label
        }()
        
        let horizontalStackView: UIStackView = {
           let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 5
            stackView.alignment = .leading
            stackView.distribution = .fillProportionally
            return stackView
        }()
        
        horizontalStackView.addArrangedSubview(weatherIcon)
        horizontalStackView.addArrangedSubview(weatherLabel)
        addSubview(divider)
        addSubview(horizontalStackView)
        addSubview(weatherDetail)
        
        divider.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        weatherDetail.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(divider.snp.centerX).offset(15)
        }
        horizontalStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(divider.snp.centerX).offset(-15)
        }
        
    }
}
