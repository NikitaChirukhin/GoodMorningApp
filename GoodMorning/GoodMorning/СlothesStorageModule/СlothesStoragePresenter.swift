//
//  СlothesStoragePresenter.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

protocol СlothesStorageViewProtocol: AnyObject {
    
}

protocol СlothesStoragePresenterProtocol: AnyObject {
    func navigationAddButtonTap()
}

final class СlothesStoragePresenter {
    
    private weak var clothesStorageView: СlothesStorageViewProtocol?
    private let router: RouterProtocol
//    private var clothesStorageViewModel: СlothesStorageViewModel
    
    init(view: СlothesStorageViewProtocol, router: RouterProtocol) {
        self.router = router
        self.clothesStorageView = view
//        self.clothesStorageViewModel =
    }
}

//MARK: - ClothesStoragePresenter private methods
private extension СlothesStoragePresenter {
    
}

//MARK: - СlothesStoragePresenterProtocol methods
extension СlothesStoragePresenter: СlothesStoragePresenterProtocol {
    func navigationAddButtonTap() {
        router.pushClothesSetupModule()
    }
}
