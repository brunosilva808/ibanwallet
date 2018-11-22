//
//  UINavigationBar+Extension.swift
//
//  Created by Artem Umanets on 13/11/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

public extension UINavigationBar {

    var titleColor: UIColor? {
        get { return (self.titleTextAttributes?[.foregroundColor] as? UIColor) ?? UIColor.black }
        set {
            var currentAttributes = self.titleTextAttributes ?? [NSAttributedString.Key: Any]()
            currentAttributes[.foregroundColor] = newValue
            self.titleTextAttributes = currentAttributes
        }
    }
    
    var titleFont: UIFont? {
        get { return (self.titleTextAttributes?[.font] as? UIFont) ?? UIFont.systemFont(ofSize: 15.0) }
        set {
            var currentAttributes = self.titleTextAttributes ?? [NSAttributedString.Key: Any]()
            currentAttributes[.font] = newValue
            self.titleTextAttributes = currentAttributes
        }
    }
}
