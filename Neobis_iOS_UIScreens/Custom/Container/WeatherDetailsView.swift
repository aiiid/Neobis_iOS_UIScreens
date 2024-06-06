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
        configureUI(for: .snowy, with: "15 km/h")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(for weather: WeatherState, with detail: String){
        let weatherLabel = UILabel()
        weatherLabel.text = weather.description
        weatherLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        let weatherIcon = UIImageView()
        weatherIcon.image = UIImage(systemName: weather.iconName)
        weatherIcon.tintColor = .black
        
        let weatherDetail = UILabel()
        weatherDetail.text = detail
        
        let divider: UILabel = {
            let label = UILabel()
            label.text = "|"
            return label
        }()
        
        let horizontalStackView: UIStackView = {
           let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 5
            stackView.alignment = .center
            
            return stackView
        }()
        
        horizontalStackView.addArrangedSubview(weatherIcon)
        horizontalStackView.addArrangedSubview(weatherLabel)
        horizontalStackView.addArrangedSubview(divider)
        horizontalStackView.addArrangedSubview(weatherDetail)
        
        addSubview(horizontalStackView)
        
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
