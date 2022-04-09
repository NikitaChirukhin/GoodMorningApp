//
//  WeatherView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 04.04.2022.
//

import UIKit

protocol WeatherViewDelegate: AnyObject {
    func reloadButtonTap()
}

final class WeatherView: UIView {
    
    weak var delegate: WeatherViewDelegate?
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private lazy var weatherImage = WeatherImageView(imageStyle:"Cloudy")
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.clockwise.circle.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(reloadButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 27)
        return label
    }()
    
    private lazy var temperatureFeelsLikeWeather: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .whiteText
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var stackStatusFeelsWeather: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(weatherStatusLabel)
        stackView.addArrangedSubview(temperatureFeelsLikeWeather)
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.axis = .vertical
        return stackView
    }()
    
    
    private lazy var temparatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "27°"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 66)
        return label
    }()
    
    private lazy var temparatureMaxLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var temparatureMaxChevron: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.up")
        view.contentMode = .center
        view.tintColor = .whiteText
        return view
    }()
    
    private lazy var temparatureMinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var temparatureMinChevron: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.down")
        view.contentMode = .center
        view.tintColor = .whiteText
        return view
    }()
    
    private lazy var stackOfTemparatureMinMax: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(temparatureMaxChevron)
        stackView.addArrangedSubview(temparatureMinLabel)
        stackView.addArrangedSubview(temparatureMinChevron)
        stackView.addArrangedSubview(temparatureMaxLabel)
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "City"
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    init(weatherStatus: String) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - WeatherView private methods
private extension WeatherView {
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherStatusLabel)
        addSubview(temparatureLabel)
        addSubview(stackStatusFeelsWeather)
        addSubview(weatherImage)
        addSubview(cityLabel)
        addSubview(reloadButton)
        addSubview(stackOfTemparatureMinMax)
        
        NSLayoutConstraint.activate([
            weatherImage.topAnchor.constraint(equalTo: topAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: trailingAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: screenWidth),
            weatherImage.heightAnchor.constraint(equalToConstant: screenWidth),
            
            temparatureLabel.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            temparatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            temparatureLabel.trailingAnchor.constraint(equalTo: weatherImage.leadingAnchor),
            temparatureLabel.heightAnchor.constraint(equalToConstant: screenWidth/4),
            
            stackOfTemparatureMinMax.topAnchor.constraint(equalTo: temparatureLabel.bottomAnchor, constant: -20),
            stackOfTemparatureMinMax.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackOfTemparatureMinMax.trailingAnchor.constraint(equalTo: weatherImage.leadingAnchor, constant: -30),
            stackOfTemparatureMinMax.heightAnchor.constraint(equalToConstant: screenWidth/6),
            
            cityLabel.topAnchor.constraint(equalTo: topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: weatherImage.leadingAnchor, constant: -20),
            cityLabel.bottomAnchor.constraint(equalTo: temparatureLabel.topAnchor, constant: -20),
            
            stackStatusFeelsWeather.topAnchor.constraint(equalTo: stackOfTemparatureMinMax.bottomAnchor, constant: 30),
            stackStatusFeelsWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackStatusFeelsWeather.trailingAnchor.constraint(equalTo: weatherImage.leadingAnchor),
            stackStatusFeelsWeather.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(UIScreen.main.bounds.height / 4)),
            
            reloadButton.heightAnchor.constraint(equalToConstant: 55),
            reloadButton.widthAnchor.constraint(equalToConstant: 55),
            reloadButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reloadButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc func reloadButtonTap() {
        delegate?.reloadButtonTap()
    }
}

extension WeatherView {
    func setWeather(data: StartScreenViewModel) {
        cityLabel.text = data.place
        weatherStatusLabel.text = data.actualWeather
        temparatureLabel.text = data.temperature
        temparatureMaxLabel.text = data.temperatureMax
        temparatureMinLabel.text = data.temperatureMin
        temperatureFeelsLikeWeather.text = "Feels like \(data.temperatureFeelLike)"
    }
}
