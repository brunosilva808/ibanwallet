//
//  UIImageView+Extrensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/11/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import Foundation
import UIKit

public extension UIImageView {

    func tint(with color: UIColor) {
        self.tintColor = color
        self.image = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    }
}
