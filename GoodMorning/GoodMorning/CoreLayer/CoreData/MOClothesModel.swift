//
//  MOClothesModel.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 10.04.2022.
//

import Foundation

struct MOClothesItemModel {
    var name: String
    var color: String
    var type: Int16
    var picture: String
    var temperature: String
}

extension MOClothesItemModel {
    init(item: ClothesItem) {
        self.name = item.name
        self.color = item.color
        self.type = Int16(item.type)
        self.picture = item.picture
        self.temperature = item.temperature
    }
}
