//
//  SceneDelegate.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 09.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let moduleBuilder = ModuleBuilder()
        
        window?.rootViewController = moduleBuilder.createTabBar()
        window?.makeKeyAndVisible()
    }
}

