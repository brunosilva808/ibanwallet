//
//  UIViewController+UINib.swift
//
//  Created by Artem Umanets on 13/11/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    static func fromNib() -> Self {
        
        func instanceFromNib<T: UIViewController>() -> T {
            
            return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as! T
        }
        return instanceFromNib()
    }
    
    static func from(storyboard: UIStoryboard) -> Self {
        
        func instanceFromStoryboard<T: UIViewController>() -> T {
            
            return storyboard.instantiateViewController(withIdentifier: "\(self)") as! T
        }
        return instanceFromStoryboard()
    }
}

public extension UIWindow {
    
    var visibleViewController: UIViewController {
        
        return UIWindow.getVisibleViewController(from: self.rootViewController!)
    }
    
    private class func getVisibleViewController(from vc: UIViewController) -> UIViewController {
        
        if let visibleViewController = (vc as? UINavigationController)?.visibleViewController { return UIWindow.getVisibleViewController(from: visibleViewController) }
        else if let visibleViewController = (vc as? UITabBarController)?.selectedViewController { return UIWindow.getVisibleViewController(from: visibleViewController) }
        else {
            if let presentedViewController = vc.presentedViewController { return UIWindow.getVisibleViewController(from: presentedViewController)
            } else { return vc }
        }
    }
}
