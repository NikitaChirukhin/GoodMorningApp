//
//  WeatherImageView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 04.04.2022.
//

import UIKit

final class WeatherImageView: UIView {
    
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - WeatherImageView private methods
private extension WeatherImageView {
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 253.0/255.0, green: 233.0/255.0, blue: 16.0/255.0, alpha: 0.1)
        layer.cornerRadius = UIScreen.main.bounds.width / 2
        
        addSubview(weatherImage)
        
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: topAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func clearSkySetup() {
        weatherImage.image = UIImage(systemName: "sun.max")
        weatherImage.tintColor = .systemYellow
    }
    
    func fewCloudsSetup() {
        weatherImage.image = UIImage(systemName: "cloud.sun.fill")
        weatherImage.tintColor = .gray
    }
    
    func scatteredCloudsSetup() {
        weatherImage.image = UIImage(systemName: "cloud")
        weatherImage.tintColor = .gray
    }
    
    func showerRainSetup() {
        weatherImage.image = UIImage(systemName: "cloud.drizzle")
        weatherImage.tintColor = .blue
    }
    
    func rainSetup() {
        weatherImage.image = UIImage(systemName: "cloud.heavyrain")
        weatherImage.tintColor = .blue
    }
    
    func brokekCloudsSetup() {
        weatherImage.image = UIImage(systemName: "cloud.sun.fill")
        weatherImage.tintColor = .gray
    }
    
    func thunderstormSetup() {
        weatherImage.image = UIImage(systemName: "cloud.bolt.rain")
        weatherImage.tintColor = .blue
    }
    
    func snowSetup() {
        weatherImage.image = UIImage(systemName: "snowflake")
        weatherImage.tintColor = .white
    }
    
    func mistSetup() {
        weatherImage.image = UIImage(systemName: "cloud.fog")
        weatherImage.tintColor = .lightGray
    }
}

extension WeatherImageView {
    func setWeather(key: String) {
        switch key {
        case "clear sky":
            self.clearSkySetup()
        case "few clouds":
            self.fewCloudsSetup()
        case "scattered clouds":
            self.scatteredCloudsSetup()
        case "broken clouds":
            self.brokekCloudsSetup()
        case "shower rain":
            self.showerRainSetup()
        case "rain":
            self.rainSetup()
        case "thunderstorm":
            self.thunderstormSetup()
        case "snow":
            self.snowSetup()
        case "mist":
            self.mistSetup()
        default:
            print("Unknown WeatherImageError")
        }
    }
}
