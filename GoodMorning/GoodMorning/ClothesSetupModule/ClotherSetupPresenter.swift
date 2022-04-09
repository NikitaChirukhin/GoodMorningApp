//
//  ClotherSetupPresenter.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import UIKit

protocol ClothesSetupViewProtocol: UIViewController {
    
}

protocol ClotherSetupPresenterProtocol {
    func temperatureRange() -> [Int]
    func colorsViews() -> [ColorPickerViewModel]
    func pickViewNames() -> [String]
    func setColor() -> String
    func setType() -> Int
    func setTemperature() -> Int
}

final class ClotherSetupPresenter {
    
    private weak var clothesSetupView: ClothesSetupViewProtocol?
    private let router: RouterProtocol
    private var clothesViewModel: ClotherSetupViewModel
    
    init(router: Router, item: ClothesItem, view: ClothesSetupViewProtocol) {
        self.clothesSetupView = view
        self.router = router
        self.clothesViewModel = ClotherSetupViewModel(item: item)
    }
}

//MARK: - ClotherSetupPresenter private methods
private extension ClotherSetupPresenter {
    
}

extension ClotherSetupPresenter: ClotherSetupPresenterProtocol {
    func pickViewNames() -> [String] {
        clothesViewModel.clotherPickViewNames
    }
    
    func temperatureRange() -> [Int] {
        clothesViewModel.temperatureRange
    }
    
    func colorsViews() -> [ColorPickerViewModel] {
        clothesViewModel.colors
    }
    
    func setColor() -> String {
        "1"
    }
    
    func setType() -> Int {
        1
    }
    
    func setTemperature() -> Int {
        1
    }
}
