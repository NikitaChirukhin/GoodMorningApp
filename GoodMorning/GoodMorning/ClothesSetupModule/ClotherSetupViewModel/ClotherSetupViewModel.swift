//
//  ClotherSetupViewModel.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import Foundation

struct ClotherSetupViewModel: ClothesStorageModelProtocol {
    var name: String
    
    var color: String
    
    var picture: String
    
    var temperature: String
    
    var type: Int
}

extension ClotherSetupViewModel {
    init(item: ClothesStorageModelProtocol) {
        name = item.name
        color = item.color
        picture = item.picture
        temperature = item.temperature
        type = item.type
    }
}
