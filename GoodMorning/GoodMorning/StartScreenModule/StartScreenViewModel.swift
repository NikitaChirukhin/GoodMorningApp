//
//  StartScreenViewModel.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import Foundation

struct StartScreenViewModel {
    var weatherDescription: String
    var actualWeather: String
    var temperature: String
    var temperatureMax: String
    var temperatureMin: String
    var temperatureFeelLike: String
    var country: String
    var place: String
}

extension StartScreenViewModel {
    init(rawData: WeatherRawDataModel) {
        weatherDescription = rawData.weather[0, default: Weather(mainDescriptionOfWeather: "",
                                                                   actualWeather: "")].mainDescriptionOfWeather
        actualWeather = rawData.weather[0, default: Weather(mainDescriptionOfWeather: "",
                                                              actualWeather: "")].actualWeather
        temperature = String(Int(rawData.main.temperature - 273.15)) + "°"
        temperatureMax = String(Int(rawData.main.temperatureMax - 273.15)) + "°"
        temperatureMin = String(Int(rawData.main.temperatureMin - 273.15)) + "°"
        temperatureFeelLike = String(Int(rawData.main.temperatureFeelLike - 273.15)) + "°"
        country = rawData.sys.country
        place = rawData.name
    }
}

