//
//  WeatherWeekModel.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import Foundation

struct WeatherWeekModel {
    let day: String
    let icon: String
    let degree: String
}

let weatherWeekMockData = [
    WeatherWeekModel(day: "Апр, 27", icon: weatherIcons.randomElement()!, degree: "16°C"),
    WeatherWeekModel(day: "Апр, 28", icon: weatherIcons.randomElement()!, degree: "19°C"),
    WeatherWeekModel(day: "Апр, 29", icon: weatherIcons.randomElement()!, degree: "23°C"),
    WeatherWeekModel(day: "Апр, 30", icon: weatherIcons.randomElement()!, degree: "21°C"),
    WeatherWeekModel(day: "Май, 1", icon: weatherIcons.randomElement()!, degree: "22°C"),
    WeatherWeekModel(day: "Май, 2", icon: weatherIcons.randomElement()!, degree: "23°C"),
    WeatherWeekModel(day: "Май, 3", icon: weatherIcons.randomElement()!, degree: "25°C")
]
