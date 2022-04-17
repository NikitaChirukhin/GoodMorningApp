//
//  NetworkService.swift
//  Clothesline
//
//  Created by Никита Чирухин on 01.04.2022.
//

import UIKit

protocol NetworkServiceProtocol {
    func getWeatherDataFromApi(longitudeAtribute: String, latitudeAtribute: String, completion: @escaping (Result<WeatherRawDataModel, Error>) -> Void)
}

final class NetworkService {
    private let apiKey = "472e02a5bccd9c3ba8286e9e0cb975f6"
    private lazy var networkCore = NetworkCore()
}

//MARK: - NetworkServiceProtocol methods
extension NetworkService: NetworkServiceProtocol {
    func getWeatherDataFromApi(longitudeAtribute: String, latitudeAtribute: String, completion: @escaping (Result<WeatherRawDataModel, Error>) -> Void) {
        let urlFetch = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitudeAtribute)&lon=\(longitudeAtribute)&appid=\(apiKey)"
        networkCore.genericFetch(url: urlFetch, completion: completion)
    }
}
