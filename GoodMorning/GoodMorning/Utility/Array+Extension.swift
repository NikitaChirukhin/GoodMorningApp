//
//  Array+Extension.swift
//  Clothesline
//
//  Created by Никита Чирухин on 02.04.2022.
//

import Foundation

extension Array {
    public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }
        return self[index]
    }
}
