//
//  File.swift
//  Clothesline
//
//  Created by Никита Чирухин on 05.04.2022.
//

import Foundation

final class DataConverter {
    static func todayData() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en-US")
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE MMM d")
        return dateFormatter.string(from: Date())
    }
}
