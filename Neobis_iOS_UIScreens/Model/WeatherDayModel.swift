//
//  weatherDayDetailedData.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 07/06/2024.
//

import Foundation

struct WeatherDayModel {
    let degree: String
    let icon: String
    let time: String
}
let weatherIcons = ["cloudy.png", "moonCloud.png", "rain.png", "sunCloud.png", "sunshine.png"]

let weatherDayMockData = [
    WeatherDayModel(degree: "29°C", icon: weatherIcons.randomElement()!, time: "15.00"),
    WeatherDayModel(degree: "26°C", icon: weatherIcons.randomElement()!, time: "16.00"),
    WeatherDayModel(degree: "24°C", icon: weatherIcons.randomElement()!, time: "17.00"),
    WeatherDayModel(degree: "23°C", icon: weatherIcons.randomElement()!, time: "18.00"),
    WeatherDayModel(degree: "22°C", icon: weatherIcons.randomElement()!, time: "19.00"),
    WeatherDayModel(degree: "23°C", icon: weatherIcons.randomElement()!, time: "20.00"),
    WeatherDayModel(degree: "25°C", icon: weatherIcons.randomElement()!, time: "21.00")
]
