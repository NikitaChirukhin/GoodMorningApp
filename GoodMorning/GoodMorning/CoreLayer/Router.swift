//
//  Router.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

protocol RouterProtocol {
    func pushClothesSetupModule(item: ClothesItem)
}

final class Router {
    
    private let navigationController: UINavigationController
    private let moduleBuilder: ModuleBuilder?

    func pushClothesSetupModule(item: ClothesItem) {
        guard let clothesSetupView = moduleBuilder?.createClothesSetupModule(router: self, item: item) else { return }
        navigationController.pushViewController(clothesSetupView, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilder) {
        self.moduleBuilder = moduleBuilder
        self.navigationController = navigationController
    }
}

//MARK: - RouterProtocol methods
extension Router: RouterProtocol {
    
}
