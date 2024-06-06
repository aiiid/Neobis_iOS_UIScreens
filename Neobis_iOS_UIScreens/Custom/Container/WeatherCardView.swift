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
    
    private func configureUI(){
        addSubview(dateTitle)
        addSubview(degreeLabel)
        addSubview(descriptionLabel)
        
        
    }

}
