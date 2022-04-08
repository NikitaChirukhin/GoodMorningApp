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
}

//MARK: - private methods
private extension NetworkService {
    func genericFetch<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(NetworkError.serverError))
                return
            }
            do {
                guard let data = data else { return }
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(.success(obj))
            } catch  (let error) {
                completion(.failure(error))
            }
        }
        .resume()
    }

}

//MARK: - NetworkServiceProtocol methods
extension NetworkService: NetworkServiceProtocol {
    func getWeatherDataFromApi(longitudeAtribute: String, latitudeAtribute: String, completion: @escaping (Result<WeatherRawDataModel, Error>) -> Void) {
        let urlFetch = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitudeAtribute)&lon=\(longitudeAtribute)&appid=\(apiKey)"
        genericFetch(url: urlFetch, completion: completion)
    }
}
