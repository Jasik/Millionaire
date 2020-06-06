//
//  Date+Extension.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/06.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

extension Date {
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
