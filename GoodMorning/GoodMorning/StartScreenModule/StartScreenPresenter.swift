//
//  StartScreenPresenter.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

protocol StartScreenViewProtocol: AnyObject {
    func weatherDataFailure()
    func weatherDataSuccess(data: StartScreenViewModel)
}

protocol StartScreenPresenterProtocol {
    func getWeather()
}

final class StartScreenPresenter {
    
    private weak var startScreenView: StartScreenViewProtocol?
    private let netwotkService: NetworkServiceProtocol
    private let router: RouterProtocol
    private let locationManager: LocationManager
    
    init(networkService: NetworkServiceProtocol, view: StartScreenViewProtocol, router: RouterProtocol, locationManager: LocationManager) {
        self.netwotkService = networkService
        self.router = router
        self.startScreenView = view
        self.locationManager = locationManager
        
        setupLocationManager()
    }
}

//MARK: - StartScreenPresenter private methods
private extension StartScreenPresenter {
    func setupLocationManager() {
        locationManager.accessStatus()
    }
    
    func getWeatherData(longitudeAtribute: String, latitudeAtribute: String) {
        netwotkService.getWeatherDataFromApi(longitudeAtribute: longitudeAtribute,
                                             latitudeAtribute: latitudeAtribute,
                                             completion: { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let viewData = StartScreenViewModel(rawData: data)
                    self.startScreenView?.weatherDataSuccess(data: viewData)
                case .failure(let error):
                    print(error)
                }
            }
        })

    }
}

//MARK: - StartScreenPresenterProtocol methods
extension StartScreenPresenter: StartScreenPresenterProtocol {
    func getWeather() {
        //wait view to setup
        DispatchQueue.main.async {
            do {
                let location = try self.locationManager.findLocation()
                self.getWeatherData(longitudeAtribute: location.longitudeAtribute, latitudeAtribute: location.latitudeAtribute)
            } catch {
                print(error)
            }
        }
    }
}

