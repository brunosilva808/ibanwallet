//
//  UIView+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

extension UIView {

    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    func subviews<T>(of type: T.Type) -> [T] {
        var subviewsOfKind = [T]()
        self.subviews.forEach {
            if let subviewSameKind = $0 as? T {
                subviewsOfKind.append(subviewSameKind)
            }
            subviewsOfKind.append(contentsOf: $0.subviews(of: type))
        }
        return subviewsOfKind
    }
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: type) }
    }
    
    func subview<T>(of type: T.Type) -> T? {
        return subviews.compactMap { $0 as? T ?? $0.subview(of: type) }.first
    }
}

extension UIView {
    
    func setRounded(toRadius: CGFloat, corners: UIRectCorner = .allCorners, estimatedSize: CGSize? = nil) {
        self.clipsToBounds = true
        
        let boundsToMask = CGRect(x: 0.0, y: 0.0, width: estimatedSize?.width ?? self.bounds.width, height: estimatedSize?.height ?? self.bounds.height)
        let path = UIBezierPath(roundedRect: boundsToMask, byRoundingCorners: corners, cornerRadii: CGSize(width: toRadius, height: toRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func setRoundedCorners(toRadius radius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func setBorder(color: UIColor, thickness: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
    }
    
    func setShadow(color: UIColor, radius: CGFloat, offsetX: CGFloat = 0, offsetY: CGFloat = 0) {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 1.0
    }
}

extension UIView {
    
    func constraint(for attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        
        var queryView: UIView? = self
        let superviewContraints: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom, .leading, .trailing, .centerX, .centerY]
        if superviewContraints.contains(attribute) {
            queryView = self.superview
        }
        
        return (queryView?.constraints.filter {
            let sameAttrbiute = ($0.firstAttribute == attribute)
            let isView1 = (self == ($0.firstItem as? UIView))
            let isView2 = (self == ($0.secondItem as? UIView))
            return sameAttrbiute && (isView1 || isView2)
            }
            .first!)!
    }
    
    func setContraintsEqualToSuperview() {
        guard let superview = self.superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let right = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        let contraints = [left, right, top, bottom]
        contraints.forEach {$0.isActive = true }
        superview.addConstraints(contraints)
    }
}

extension UIView {
    
    static func fromNib() -> Self  {
        
        func instanceFromNib<T: UIView>() -> T {
            
            return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as! T
        }
        return instanceFromNib()
    }
}
