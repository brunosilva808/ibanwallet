//
//  UITextField+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import UIKit

enum TextFieldStyle {
    case form
}

extension UITextField {

    func set(color: UIColor, font: UIFont, text: String? = nil) {
        self.textColor = color
        self.font = font
        if let text = text { self.text = text }
    }
    
    func set(style: TextFieldStyle) {
        
        switch style {
        case .form:
            self.set(color: Theme.Color.Primary.content, font: Theme.Font.arialRegular(ofSize: 14.0))
            self.superview?.setRoundedCorners(toRadius: 4.0)
            self.superview?.setBorder(color: Theme.Color.Primary.separator, thickness: 1.0)
        }
    }
}
