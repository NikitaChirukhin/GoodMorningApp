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
//    private var
    
    init(view: СlothesStorageViewProtocol, router: RouterProtocol, coreData: CoreData) {
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
        router.pushClothesSetupModule(item: ClothesItem(name: "", color: "Green", type: 1, picture: "hat", temperature: "-23"))
    }
}
