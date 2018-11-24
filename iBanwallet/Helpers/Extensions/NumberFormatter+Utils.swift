//
//  NumberFormatter+Utils.swift
//  SmartDrive
//
//  Created by Artem Umanets on 11/10/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    static func formatterCurrency(for value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "pt_PT")
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.decimalSeparator = ","
        if let formattedValue = numberFormatter.string(from: NSNumber(value: value)) {
            return "\(formattedValue)€"
        }
        return ""
    }
}
