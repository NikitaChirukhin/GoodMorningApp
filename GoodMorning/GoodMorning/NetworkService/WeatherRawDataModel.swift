//
//  WeatherRawDataModel.swift
//  Clothesline
//
//  Created by Никита Чирухин on 02.04.2022.
//

import Foundation

struct WeatherRawDataModel: Decodable {
    var weather: [Weather]
    var main: Temperature
    var sys: Country
    var name: String
}

struct Weather: Decodable {
    var mainDescriptionOfWeather: String
    var actualWeather: String
    
    enum CodingKeys: String, CodingKey {
        case mainDescriptionOfWeather = "main"
        case actualWeather = "description"
    }
}

struct Temperature: Decodable {
    var temperature: Double
    var temperatureMax: Double
    var temperatureMin: Double
    var temperatureFeelLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMax = "temp_min"
        case temperatureMin = "temp_max"
        case temperatureFeelLike = "feels_like"
    }
}

struct Country: Decodable {
    var country: String
}
