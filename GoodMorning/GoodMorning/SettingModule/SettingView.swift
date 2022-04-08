//
//  SettingView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

protocol SettingViewProtocol {
    
}

final class SettingView: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSettingView()
    }
}

//MARK: - SettingViewProtocol methods
extension SettingView: SettingViewProtocol {
    
}

//MARK: - SettingView privat methods
private extension SettingView {
    func setupSettingView() {
        
        view.backgroundColor = .systemBackground
    }
}
