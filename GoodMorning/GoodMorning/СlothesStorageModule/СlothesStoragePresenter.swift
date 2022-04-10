//
//  СlothesStoragePresenter.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

protocol СlothesStorageViewProtocol: AnyObject {
    func success()
}

protocol СlothesStoragePresenterProtocol: AnyObject {
    func navigationAddButtonTap()
    func viewNeedNewData()
    func clothesItemBykey(key: Int) -> [ColletionClothesViewModel]
    func deleteButtonTap(key: String)
    func editButtonTap(key: String)
}

final class СlothesStoragePresenter {
    
    private weak var clothesStorageView: СlothesStorageViewProtocol?
    private let router: RouterProtocol
    private var clothesStorageViewModel: [ClothesItem] = []
    private var coreData: CoreDataProtocol
    
    init(view: СlothesStorageViewProtocol, router: RouterProtocol, coreData: CoreData) {
        self.router = router
        self.clothesStorageView = view
        self.coreData = coreData
    }
}

//MARK: - ClothesStoragePresenter private methods
private extension СlothesStoragePresenter {
    
}

//MARK: - СlothesStoragePresenterProtocol methods
extension СlothesStoragePresenter: СlothesStoragePresenterProtocol {
    func deleteButtonTap(key: String) {
        if let index = clothesStorageViewModel.firstIndex(where: {$0.name == key}) {
            coreData.deleteItem(item: MOClothesItemModel(item: clothesStorageViewModel[index]))
        }
    }
    
    func editButtonTap(key: String) {
        
    }
    
    func clothesItemBykey(key: Int) -> [ColletionClothesViewModel] {
        var viewModel: [ColletionClothesViewModel] = []
        for item in clothesStorageViewModel {
            if item.type == key {
                if let index = ClothesImageSetupViewModel.colors.firstIndex(where: {$0.colorName == item.color}) {
                    viewModel.append(ColletionClothesViewModel(color: ClothesImageSetupViewModel.colors[index].uiColor,
                                                               name: item.name,
                                                               type: item.type))
                }
            }
        }
        return viewModel
    }
    
    func navigationAddButtonTap() {
        router.pushClothesSetupModule(item: nil)
    }
    
    func viewNeedNewData() {
        do {
            let data = try coreData.getItems()
        clothesStorageViewModel = data
        } catch let error {
            print(error)
        }
    }
}
