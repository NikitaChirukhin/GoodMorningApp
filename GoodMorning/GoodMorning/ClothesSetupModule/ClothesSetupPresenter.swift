//
//  ClotherSetupPresenter.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import UIKit

protocol ClothesSetupViewProtocol: UIViewController {
    func showAlert()
    func setParametrsIfNeeded()
}

protocol ClotherSetupPresenterProtocol {
    func setColor() -> String
    func setType() -> Int
    func setTemperature() -> Int
    func saveButtonTap(color: String, name: String?, temperature: String?, type: Int?)
}

final class ClothesSetupPresenter {
    
    private weak var clothesSetupView: ClothesSetupViewProtocol?
    private let router: RouterProtocol
    private var clothesViewModel: ClotherSetupViewModel
    private let coreData: CoreDataProtocol
    
    init(router: Router, item: ClothesStorageModelProtocol?, view: ClothesSetupViewProtocol, coreData: CoreData) {
        self.clothesSetupView = view
        self.router = router
        self.coreData = coreData
        if let item = item {
            self.clothesViewModel = ClotherSetupViewModel(item: item)
        } else {
            clothesViewModel = ClotherSetupViewModel(name: "", color: "Clear", picture: "", temperature: "", type: 0)
        }
    }
}

//MARK: - ClotherSetupPresenter private methods
private extension ClothesSetupPresenter {
    
}

extension ClothesSetupPresenter: ClotherSetupPresenterProtocol {
    func saveButtonTap(color: String, name: String?, temperature: String?, type: Int?) {
        if let temperature = temperature, let type = type, let name = name {
            print("\(temperature) \(type) \(name) \(color)")
            coreData.save(object: MOClothesItemModel(name: name,
                                              color: color,
                                              type: Int16(type),
                                              picture: ClothesImageSetupViewModel.clotherPickViewNames[type],
                                              temperature: temperature))
            router.pop()
        } else {
            clothesSetupView?.showAlert()
        }
    }
    func setColor() -> String {
        clothesViewModel.color
    }
    
    func setType() -> Int {
        clothesViewModel.type
    }
    
    func setTemperature() -> Int {
        Int(clothesViewModel.temperature) ?? 0
    }
    
    func setName() -> String {
        "1"
    }
}
