//
//  UIButton+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import UIKit

enum ButtonStyle {
    case custom
    case fidelidade
    case primary
    case secondary
    case linkStrong
    case linkSoft
    case link(UIFont, UIColor)
}

extension UIButton {

//    func set(style: ButtonStyle, title: String? = nil, image: UIImage? = nil, tint: UIColor? = nil) {
//
//        if let title = title { self.setTitle(title, for: .normal) }
//        if let image = image { self.setImage(image, for: .normal) }
//        if let tint = tint { self.tintColor = tint }
//
//        self.tintAdjustmentMode = .normal
//
//        switch style {
//        case .fidelidade:
//            if AppDefaults.Cached.lastContactDate?.to(.dmy) == Date().to(.dmy) {
//                self.isUserInteractionEnabled = false
//                self.tintColor = Theme.Color.Primary.content
//                self.titleLabel?.font = Theme.Font.arialBold(ofSize: 14)
//                self.setTitleColor(Theme.Color.Primary.content, for: .normal)
//                self.setTitle(" " + l("Confirm.Contact.FedelidadeAlreadyContacted"), for: .normal)
//                self.setBackgroundImage(nil, for: .normal)
//                self.setImage(UIImage(named: "IconCheckMark"), for: .normal)
//                self.superview?.backgroundColor = Theme.Color.Primary.footer
//            } else {
//                self.isUserInteractionEnabled = true
//                self.titleLabel?.lineBreakMode = .byWordWrapping
//                self.titleLabel?.numberOfLines = 2
//                self.titleLabel?.textAlignment = .center
//                self.set(style: ButtonStyle.primary, title: title, image: image)
//                self.setTitleColor(tint, for: .normal)
//                self.setBackgroundImage(#imageLiteral(resourceName: "red"), for: .normal)
//                self.superview?.backgroundColor = Theme.Color.none
//            }
//        case .primary:
//            self.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 25)
//            self.titleLabel?.font = Theme.Font.prometoBold(ofSize: 14.0)
//            self.setBackgroundImage(#imageLiteral(resourceName: "PrimaryButtonBackground"), for: .normal)
//            self.tintColor = Theme.Color.Primary.buttonTitle
//            self.setRoundedCorners(toRadius: 10.0)
//        case .secondary:
//            self.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 25)
//            self.titleLabel?.font = Theme.Font.prometoBold(ofSize: 14.0)
//            self.setBackgroundImage(#imageLiteral(resourceName: "ButtonBorder"), for: .normal)
//            self.tintColor = Theme.Color.Primary.accent2
//            self.setTitleColor(Theme.Color.Primary.accent2, for: .normal)
//            self.setTitleColor(Theme.Color.Primary.accent2.intensify(by: -0.3), for: .highlighted)
//            self.setRoundedCorners(toRadius: 0.0)
//        case .linkSoft:
//            self.tintColor = Theme.Color.Primary.content
//            if let title = title {
//                self.setAttributedTitle(title.attributed().with(font: Theme.Font.arialRegular(ofSize: 14.0)).underline().with(color: Theme.Color.Primary.content), for: .normal)
//            }
//        case .linkStrong:
//            self.tintColor = Theme.Color.Primary.content
//            if let title = title {
//                self.setAttributedTitle(title.attributed().with(font: Theme.Font.arialBold(ofSize: 14.0)).underline().with(color: Theme.Color.Primary.content), for: .normal)
//            }
//        case .link(let font, let color):
//            self.tintColor = color
//            if let title = title {
//                self.setAttributedTitle(title.attributed().with(font: font).underline().with(color: color), for: .normal)
//            }
//        default: break
//        }
//    }

    func alignTitleBelowImage() {
        
        let spacing: CGFloat = 2.0
        
        let imageSize = self.imageView?.frame.size ?? .zero
        self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
        let titleSize = self.titleLabel?.frame.size ?? .zero
        self.imageEdgeInsets = UIEdgeInsets.init(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
    }
}
