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
    private var coreData: CoreData
    
    init(view: СlothesStorageViewProtocol, router: RouterProtocol, coreData: CoreData) {
        self.router = router
        self.clothesStorageView = view
        self.coreData = coreData
        
        getAllItem()
    }
}

//MARK: - ClothesStoragePresenter private methods
private extension СlothesStoragePresenter {
    func getAllItem() {
        
        do {
            let data = try coreData.getItems()
            print("Items: \(data)")
        } catch let error {
            print(error)
        }
    }
}

//MARK: - СlothesStoragePresenterProtocol methods
extension СlothesStoragePresenter: СlothesStoragePresenterProtocol {
    func navigationAddButtonTap() {
        router.pushClothesSetupModule(item: nil)
    }
}
