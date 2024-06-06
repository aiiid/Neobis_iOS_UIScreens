//
//  weatherState.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 06/06/2024.
//

import UIKit

enum WeatherState {
    case sunny
    case windy
    case rainy
    case cloudy
    case snowy
    case stormy

    var description: String {
        switch self {
        case .sunny:
            return "Sunny"
        case .windy:
            return "Windy"
        case .rainy:
            return "Rainy"
        case .cloudy:
            return "Cloudy"
        case .snowy:
            return "Snowy"
        case .stormy:
            return "Stormy"
        }
    }
    
    var iconName: String {
        switch self {
        case .sunny:
            return "sun.max"
        case .windy:
            return "wind"
        case .rainy:
            return "cloud.rain"
        case .cloudy:
            return "cloud"
        case .snowy:
            return "snow"
        case .stormy:
            return "cloud.bolt"
        }
    }
}
