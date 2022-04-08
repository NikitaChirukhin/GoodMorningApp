//
//  ClothesTors.swift
//  Clothesline
//
//  Created by Никита Чирухин on 08.04.2022.
//

import Foundation

struct ClothesTors: ClothesStorageModelProtocol {
    var name: String
    
    var color: String?
    
    var type: Int
    
    var picture: String
    
    var temperature: String
    
    var outerwear: Bool?
    
    var id: Int
}

