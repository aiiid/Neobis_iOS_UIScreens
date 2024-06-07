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

let weatherDayMockData = [
    WeatherDayModel(degree: "29°C", icon: "cloud", time: "15.00"),
    WeatherDayModel(degree: "26°C", icon: "cloud.bolt", time: "16.00"),
    WeatherDayModel(degree: "24°C", icon: "cloud.sun.rain", time: "17.00"),
    WeatherDayModel(degree: "23°C", icon: "cloud.sun", time: "18.00"),
    WeatherDayModel(degree: "22°C", icon: "cloud.rainbow.half", time: "19.00"),
    WeatherDayModel(degree: "23°C", icon: "cloud.sun", time: "20.00"),
    WeatherDayModel(degree: "25°C", icon: "sun.min", time: "21.00")
]
