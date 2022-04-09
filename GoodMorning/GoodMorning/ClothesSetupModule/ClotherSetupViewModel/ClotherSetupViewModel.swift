//
//  ClotherSetupViewModel.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import Foundation

struct ClotherSetupViewModel {
    var clothes: ClothesItem
    
    let clotherPickViewNames = ["hat", "coat", "pant", "shoe"]
    let colors: [ColorPickerViewModel] = [ColorPickerViewModel(colorName: "Clear", uiColor: .clear),
                                          ColorPickerViewModel(colorName: "Gray", uiColor: .gray),
                                          ColorPickerViewModel(colorName: "Red", uiColor: .red),
                                          ColorPickerViewModel(colorName: "Yellow", uiColor: .yellow),
                                          ColorPickerViewModel(colorName: "Blue", uiColor: .blue),
                                          ColorPickerViewModel(colorName: "Green", uiColor: .green)]
    let temperatureRange: [Int] = Array(-35...35)
    
    init(item: ClothesItem) {
        clothes = item
    }
}
