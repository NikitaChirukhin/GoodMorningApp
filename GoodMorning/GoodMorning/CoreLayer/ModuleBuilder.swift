//
//  ModuleBuilder.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    func createTabBar() -> UITabBarController
    func createClothesSetupModule(router: Router) -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {
    
    private func createNavigationController(controller: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        controller.title = title
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        return navigationController
    }
    
    private func createClothesStorageView(navigationTitle: String, navigationImage: UIImage?) -> UIViewController {
        let view = СlothesStorageView()
        let navController = createNavigationController(controller: view, title: navigationTitle, image: navigationImage)
        let router = Router(navigationController: navController, moduleBuilder: self)
        let presenter = СlothesStoragePresenter(view: view, router: router)
        view.presenter = presenter
        return navController
    }
    
    private func createStartScreenView(navigationTitle: String, navigationImage: UIImage?) -> UIViewController {
        let locationManager = LocationManager()
        let view = StartScreenView()
        let networkService = NetworkService()
        let navController = createNavigationController(controller: view, title: navigationTitle, image: navigationImage)
        navController.title = "Home"
        let router = Router(navigationController: navController, moduleBuilder: self)
        let presenter = StartScreenPresenter(networkService: networkService, view: view, router: router, locationManager: locationManager)
        view.startScreenPresenter = presenter
        return navController
    }
    
    private func createSettingView(navigationTitle: String, navigationImage: UIImage?) -> UIViewController {
        let viewController = SettingView()
        let navController = createNavigationController(controller: viewController, title: navigationTitle, image: navigationImage)
        return navController
    }
}

//MARK: - ModuleBuilderProtocol methods
extension ModuleBuilder {
    
    func createTabBar() -> UITabBarController {
        let tabBarController = UITabBarController()
    
        let startScreenView = createStartScreenView(navigationTitle: DataConverter.todayData(),
                                                    navigationImage: UIImage(systemName: "house"))
        let clothesStorageView = createClothesStorageView(navigationTitle: "Storage",
                                                          navigationImage: UIImage(systemName: "bag"))
        let settingView = createSettingView(navigationTitle: "Setting",
                                            navigationImage: UIImage(systemName: "gearshape"))
        
        tabBarController.viewControllers = [startScreenView, clothesStorageView, settingView]
        tabBarController.tabBar.tintColor = .black
        return tabBarController
    }
    
    func createClothesSetupModule(router: Router) -> UIViewController {
        let view = ClotherSetupView()
        return view
    }
}