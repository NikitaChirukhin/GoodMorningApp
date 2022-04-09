//
//  ClothesHead.swift
//  Clothesline
//
//  Created by Никита Чирухин on 08.04.2022.
//

import Foundation

struct ClothesItem: ClothesStorageModelProtocol {
    var name: String
    
    var color: String?
    
    var type: Int
    
    var picture: String
    
    var temperature: String
}

//extension ClothesHeads {
//    init(with clothesDTO: MOClothesHeads) {
//        self.name = clothesDTO.name ?? ""
//        self.color = clothesDTO.color ?? ""
//        self.type = Int(clothesDTO.type)
//        self.headType = clothesDTO.headType ?? ""
//        self.picture = clothesDTO.picture ?? ""
//        self.temperature = clothesDTO.temperature ?? ""
//    }
//}
