//
//  StartScreenView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

final class StartScreenViewController: UIViewController {

    var startScreenPresenter: StartScreenPresenterProtocol!
    
    private lazy var weatherView = WeatherView(weatherStatus: "Default")
    
    private lazy var loadImage = LoadImage()
    
    private lazy var navigationCelsuisButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem()
        navButton.title = "°C"
        navButton.tintColor = .white
        return navButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tabBarItem.badgeColor = .clear
        
        startScreenPresenter.getWeather()
        setGradientBackground()
    }
}

//MARK: - StartScreenView privat Methods
private extension StartScreenViewController {
    func setupView() {
        weatherView.delegate = self
        navigationItem.rightBarButtonItem = navigationCelsuisButton

        view.addSubview(weatherView)
        view.addSubview(loadImage)
        
        NSLayoutConstraint.activate([
            loadImage.topAnchor.constraint(equalTo: view.topAnchor),
            loadImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            weatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    func setGradientBackground() {
        let colorTop = UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
                
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}

//MARK: - Protocol Methods
extension StartScreenViewController: StartScreenViewProtocol {
    func weatherDataFailure() {
        
    }
    
    func weatherDataSuccess(data: StartScreenViewModel) {
        weatherView.setWeather(data: data)
        UIView.transition(with: loadImage, duration: 1.5,
                          options: .transitionCrossDissolve,
                          animations: {
            self.loadImage.alpha = 0
        })
    }
}

//MARK: - WeatherViewDelegate Methods
extension StartScreenViewController: WeatherViewDelegate {
    func reloadButtonTap() {
        startScreenPresenter.getWeather()
    }
}
