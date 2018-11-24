//
//  UILabel+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import UIKit

extension UILabel {

    func set(color: UIColor, font: UIFont, text: String? = nil) {
        self.textColor = color
        self.font = font
        if let text = text { self.text = text }
    }
}
