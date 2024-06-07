//
//  WeatherCardView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 06/06/2024.
//

import UIKit

class WeatherCardView: UIView {

    private var dateTitle = UILabel()
    private var degreeLabel = UILabel()
    private var descriptionLabel = UILabel()
    
    private var firstWeatherDetails = WeatherDetailsView()
    private var secondWeatherDetails = WeatherDetailsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = UIColor.white.withAlphaComponent(0.3)
        layer.cornerRadius = 20
        
        let verticalStackView: UIStackView = {
           let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .fillProportionally
            
            return stackView
        }()
        
        verticalStackView.addArrangedSubview(dateTitle)
        verticalStackView.addArrangedSubview(degreeLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(firstWeatherDetails)
        verticalStackView.addArrangedSubview(secondWeatherDetails)
        
        dateTitle.text = "Сегодня, 26 Апрель"
        degreeLabel.text = "22"
        degreeLabel.font = .systemFont(ofSize: 65, weight: .bold)
        degreeLabel.textAlignment = .center
        degreeLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.text = "Солнечно"
        
        [dateTitle, degreeLabel, descriptionLabel].forEach { $0.textColor = .white }
        
        firstWeatherDetails.configureUI(for: .windy, with: "15 km/h")
        secondWeatherDetails.configureUI(for: .rainy, with: "26 %")
       
        addSubview(verticalStackView)
        firstWeatherDetails.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        secondWeatherDetails.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(30)
        }
    }
}
