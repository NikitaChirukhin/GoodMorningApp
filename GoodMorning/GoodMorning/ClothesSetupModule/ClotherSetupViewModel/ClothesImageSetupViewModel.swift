//
//  ClothesImageSetupViewModel.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 09.04.2022.
//

import Foundation

struct ClothesImageSetupViewModel {
    static let clothesPickViewNames = ["hat", "coat", "pant", "shoe"]
    static let colors: [ColorPickerViewModel] = [ColorPickerViewModel(colorName: "Clear", uiColor: .clear),
                                                 ColorPickerViewModel(colorName: "Gray", uiColor: .gray),
                                                 ColorPickerViewModel(colorName: "Brown", uiColor: .brown),
                                                 ColorPickerViewModel(colorName: "Yellow", uiColor: .yellow),
                                                 ColorPickerViewModel(colorName: "Blue", uiColor: .blue),
                                                 ColorPickerViewModel(colorName: "Green", uiColor: .green)]
    let temperatureRange: [Int] = Array(-35...35)
}
