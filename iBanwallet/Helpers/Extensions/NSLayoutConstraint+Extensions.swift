//
//  NSLayout+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    @discardableResult
    func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        
        guard let item: Any = firstItem else { return self }
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: item,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
