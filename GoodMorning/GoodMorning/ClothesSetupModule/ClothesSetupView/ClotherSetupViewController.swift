//
//  ClotherSetupView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import UIKit

final class ClotherSetupViewController: UIViewController {
    
    var presenter: ClotherSetupPresenterProtocol!
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private lazy var clothesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var clothesImageLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = screenWidth / 4
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    //MARK: - clotherPickerView setting
    private var clotherPickViews: [ClothesPickView] = []
    
    private lazy var stackClotherPickViews: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()

    //MARK: - Colors picker setting
    private var colors: [ColorPickerViewModel] = []
    
    private lazy var pickerColorView: UIPickerView = {
        let pickedView = UIPickerView()
        pickedView.translatesAutoresizingMaskIntoConstraints = false
        pickedView.delegate = self
        pickedView.dataSource = self
        return pickedView
    }()
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Color"
        label.textAlignment = .center
        return label
    }()

    //MARK: - Temperature picker setting
    private lazy var temperatureRange: [Int] = []
    
    private lazy var pickerTemperatureView: UIPickerView = {
        let pickedView = UIPickerView()
        pickedView.translatesAutoresizingMaskIntoConstraints = false
        pickedView.delegate = self
        pickedView.dataSource = self
        return pickedView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "°C"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colors = presenter.colorsViews()
        temperatureRange = presenter.temperatureRange()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickerTemperatureView.selectRow(temperatureRange.count / 2, inComponent: 0, animated: true)
    }
}

//MARK: - ClotherSetupView private methods
private extension ClotherSetupViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(clothesImageLayer)
        view.addSubview(clothesImage)
        view.addSubview(stackClotherPickViews)
  
        view.addSubview(colorLabel)
        view.addSubview(pickerColorView)
        
        view.addSubview(temperatureLabel)
        view.addSubview(pickerTemperatureView)
        
        for name in presenter.pickViewNames() {
            clotherPickViews.append(setupClothesPickView(pictureName: name))
        }
        
        NSLayoutConstraint.activate([
            clothesImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            clothesImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenWidth / 4) + 20),
            clothesImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenWidth / 4) - 20),
            clothesImage.heightAnchor.constraint(equalToConstant: (screenWidth / 2) - 40),
            
            clothesImageLayer.topAnchor.constraint(equalTo: clothesImage.topAnchor, constant: -20),
            clothesImageLayer.leadingAnchor.constraint(equalTo: clothesImage.leadingAnchor, constant: -20),
            clothesImageLayer.trailingAnchor.constraint(equalTo: clothesImage.trailingAnchor, constant: 20),
            clothesImageLayer.bottomAnchor.constraint(equalTo: clothesImage.bottomAnchor, constant: 20),
            
            stackClotherPickViews.topAnchor.constraint(equalTo: clothesImage.bottomAnchor, constant: 50),
            stackClotherPickViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackClotherPickViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackClotherPickViews.heightAnchor.constraint(equalToConstant: (screenWidth - 40 - 30) / 4),
            
            pickerColorView.topAnchor.constraint(equalTo: stackClotherPickViews.bottomAnchor, constant: 65),
            pickerColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickerColorView.widthAnchor.constraint(equalToConstant: (screenWidth / 2) - 25),
            pickerColorView.heightAnchor.constraint(equalToConstant: (screenWidth - 40 - 30) / 2),
        
            colorLabel.topAnchor.constraint(equalTo: pickerColorView.topAnchor, constant: -20),
            colorLabel.leadingAnchor.constraint(equalTo: pickerColorView.leadingAnchor),
            colorLabel.trailingAnchor.constraint(equalTo: pickerColorView.trailingAnchor),
            colorLabel.heightAnchor.constraint(equalToConstant: 20),
            
            pickerTemperatureView.topAnchor.constraint(equalTo: stackClotherPickViews.bottomAnchor, constant: 65),
            pickerTemperatureView.widthAnchor.constraint(equalToConstant: (screenWidth / 2) - 25),
            pickerTemperatureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickerTemperatureView.heightAnchor.constraint(equalToConstant: (screenWidth - 40 - 30) / 2),
            
            temperatureLabel.topAnchor.constraint(equalTo: pickerTemperatureView.topAnchor, constant: -20),
            temperatureLabel.leadingAnchor.constraint(equalTo: pickerTemperatureView.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: pickerTemperatureView.trailingAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    private func setupClothesPickView(pictureName: String) -> ClothesPickView {
        let view = ClothesPickView(pictureName: pictureName)
        stackClotherPickViews.addArrangedSubview(view)
        view.delegate = self
        return view
    }
}

//MARK: - ClotherSetupViewProtocol methods
extension ClotherSetupViewController: ClothesSetupViewProtocol {
    
}


extension ClotherSetupViewController: ClothesPickViewDelegate {
    func clothesViewPicked(imageName: String) {
        clothesImage.image = UIImage(named: imageName)
        //TO DO: - isSelectedToModel
        for i in 0...clotherPickViews.count - 1 {
            clotherPickViews[i].isSelected = false
        }
        if let pickedViewIndex = presenter.pickViewNames().firstIndex(where: {$0 == imageName}) {
            clotherPickViews[pickedViewIndex].isSelected = true
        }
    }
}

//MARK: - ClotherSetupViewController UIPickerViewDataSource methods
extension ClotherSetupViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerTemperatureView {
            return temperatureRange.count
        } else {
            return colors.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerTemperatureView {
            return String(temperatureRange[row])
        } else {
            return colors[row].colorName
        }
    }
}

//MARK: - ClotherSetupViewController UIPickerViewDelegate methods
extension ClotherSetupViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerColorView {
            clothesImageLayer.backgroundColor = colors[row].uiColor
            if colors[row].colorName != "Clear" {
                clothesImageLayer.layer.borderWidth = 0
            } else {
                clothesImageLayer.layer.borderWidth = 2
            }
        }
    }
}
