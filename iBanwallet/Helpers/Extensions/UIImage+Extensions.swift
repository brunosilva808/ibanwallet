//
//  UIImage+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/11/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func tinted(with color: UIColor, fraction: CGFloat = 0.0) -> UIImage{
        
        var image : UIImage
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        color.set()
        UIRectFill(rect)
        self.draw(in: rect, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        if fraction > 0.0{
            self.draw(in: rect, blendMode: CGBlendMode.sourceAtop, alpha: fraction)
        }
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
