//
//  LocationManager.swift
//  Clothesline
//
//  Created by Никита Чирухин on 01.04.2022.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    func accessStatus()
    func findLocation() throws -> (longitudeAtribute: String, latitudeAtribute: String)
}

final class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    override init() {
        super.init()
        accessStatus()
    }
}

//MARK: - LocationManagerProtocol methods
extension LocationManager: LocationManagerProtocol {
    func findLocation() throws -> (longitudeAtribute: String, latitudeAtribute: String) {
        locationManager.startUpdatingLocation()
        guard let location = currentLocation else { throw LocationError.noLocation }
        let longitudeAtribute = String(location.coordinate.longitude)
        let latitudeAtribute = String(location.coordinate.latitude)
        return (longitudeAtribute, latitudeAtribute)
    }
    
    func accessStatus() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
        locationManager.stopUpdatingLocation()
    }
}
