//
//  UIAlertController+Extensions.
//  SmartDrive
//
//  Created by Artem Umanets on 17/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

typealias UIAlertControllerCallback = (UIAlertController) -> ()
extension UIAlertController {
    
    static func show(title: String, message: String? = nil, yesTitle: String? = nil, noTitle: String? = nil, yesCallback: UIAlertControllerCallback? = nil, noCallback: UIAlertControllerCallback? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let noTitle = noTitle { alertController.addAction(UIAlertAction(title: noTitle, style: .cancel, handler: { (_) in noCallback?(alertController) })) }
        if let yesTitle = yesTitle { alertController.addAction(UIAlertAction(title: yesTitle, style: .default, handler: { (_) in yesCallback?(alertController) })) }
        UIApplication.shared.keyWindow?.visibleViewController.present(alertController, animated: true)
    }
}
