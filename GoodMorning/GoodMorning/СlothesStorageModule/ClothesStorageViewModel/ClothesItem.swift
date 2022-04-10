//
//  ClothesHead.swift
//  Clothesline
//
//  Created by Никита Чирухин on 08.04.2022.
//

import Foundation

struct ClothesItem: ClothesStorageModelProtocol {
    var name: String
    
    var color: String
    
    var type: Int
    
    var picture: String
    
    var temperature: String
}

extension ClothesItem {
    init(with clothesDTO: MOClothesItem) {
        self.name = clothesDTO.name ?? ""
        self.color = clothesDTO.color ?? ""
        self.type = Int(clothesDTO.type)
        self.picture = clothesDTO.picture ?? ""
        self.temperature = clothesDTO.temperature ?? ""
    }
}
//
//struct MOClothesItemModel {
//    var name: String
//    
//    var color: String
//    
//    var type: Int16
//    
//    var picture: String
//    
//    var temperature: String
//}
