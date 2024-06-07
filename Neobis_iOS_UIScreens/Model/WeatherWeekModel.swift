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
    WeatherWeekModel(day: "Апр, 27", icon: "cloud", degree: "16°C"),
    WeatherWeekModel(day: "Апр, 28", icon: "cloud.bolt", degree: "19°C"),
    WeatherWeekModel(day: "Апр, 29", icon: "cloud.sun.rain", degree: "23°C"),
    WeatherWeekModel(day: "Апр, 30", icon: "cloud.sun", degree: "21°C"),
    WeatherWeekModel(day: "Май, 1", icon: "cloud.rainbow.half", degree: "22°C"),
    WeatherWeekModel(day: "Май, 2", icon: "cloud.sun", degree: "23°C"),
    WeatherWeekModel(day: "Май, 3", icon: "sun.min", degree: "25°C")
]
