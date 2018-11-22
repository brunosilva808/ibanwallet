//
//  String+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 16/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {

    public var currentPage: Int {
        return self.currentPage(for: self.bounds.size.width)
    }
    
    public func currentPage(for pageWidth: CGFloat) -> Int {
        let width = pageWidth
        return Int((self.contentOffset.x + (0.5 * width)) / width)
    }
}
