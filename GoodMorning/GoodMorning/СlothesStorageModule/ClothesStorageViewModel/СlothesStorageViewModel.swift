//
//  СlothesStorageViewModel.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import Foundation

protocol ClothesStorageModelProtocol {
    var name: String { get }
    var color: String { get }
    var type: Int { get }     // 0 - Head, 1 - Tors, 2 - Pants, 3 - Shoe
    var picture: String { get }
    var temperature: String { get }
}

struct СlothesStorageViewModel {
    var headsModel: [ClothesItem]
    
    var torsModel: [ClothesItem]
    
    var pantsModel: [ClothesItem]
    
    var shoesModel: [ClothesItem]
}
