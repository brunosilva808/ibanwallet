//
//  UIColor+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/11/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     - parameter hex6: Six-digit hexadecimal value.
     */
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func intensify(by intesity: Double) -> UIColor {
        let intense = CGFloat(intesity)
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            var newRed = min(fRed + intense, 1.0)
            var newGreen = min(fGreen + intense, 1.0)
            var newBlue = min(fBlue + intense, 1.0)
            if newRed < 0.0 { newRed = 0.0 }
            if newGreen < 0.0 { newGreen = 0.0 }
            if newBlue < 0.0 { newBlue = 0.0 }
            
            return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: fAlpha)
        }
        return self
    }
}
