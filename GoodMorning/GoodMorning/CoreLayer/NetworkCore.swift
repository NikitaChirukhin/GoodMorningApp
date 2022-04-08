//
//  NetworkCore.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import Foundation

protocol NetworkCoreProtocol {
    func genericFetch<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) 
}

final class NetworkCore: NetworkCoreProtocol {
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
