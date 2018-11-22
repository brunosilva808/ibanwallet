//
//  Theme.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

struct Theme {
    
    struct Color {
        
        static let none = UIColor.clear
        
        struct Primary {
            
            static let background = UIColor(hex: 0xFFFFFF)
            static let footer = UIColor(hex: 0xf5f5f5) // 245 245 245
            static let content = UIColor(hex: 0x495264) // 73 82 100
            static let contentDark = UIColor(hex: 0x272b36) // 39 43 54
            static let contentLight = UIColor(hex: 0xFFFFFF)
            static let subContent = UIColor(hex: 0xa9abb1)
            static let separator = UIColor(hex: 0xdbdbdb) // 235 235 235
            static let accent1 = UIColor(hex: 0x16b660)
            static let accent2 = UIColor(hex: 0x50c0ad) // 80 192 173
            static let accent3 = UIColor(hex: 0x6bf3a9)
            static let disabled = UIColor(hex: 0xa9abb1) // 169 171 177
            static let text = UIColor(hex: 0x4a4a4a) // 74 74 74 
            static let error = UIColor(hex: 0xe2221d)
            
            static let buttonTitle = UIColor(hex: 0xFFFFFF)
            
            static let tableSelected = UIColor(hex: 0xf0f0f0)
            static let tabUnselected = UIColor(hex: 0xa9abb1)
            
            static let score = UIColor(hex: 0x50e393)
            static let emptyProgress = UIColor(hex: 0xf0eeee)
            static let overlayDark = UIColor(hex: 0x495264).withAlphaComponent(0.9)
            static let overlayLight = UIColor(hex: 0xFFFFFF).withAlphaComponent(0.9)
        }
        
        struct Dialog {
            
            static let overlay = UIColor(hex: 0x000000).withAlphaComponent(0.4)
            static let background = UIColor(hex: 0xffffff)
            static let content = UIColor(hex: 0x495264)
        }
        
        struct Header {
            static let colorTop = UIColor(hex: 0x50c0ad)
            static let colorTopDisabled = UIColor(hex: 0x909ea6)
            static let colorBottom = UIColor(hex: 0x39c26f)
            
        }
        
        struct Navigation {
            static let content = UIColor(hex: 0xFFFFFF)
            static let tabBarSeparator = UIColor(hex: 0xededed)
        }
        
        struct Stats {
            static let content =  UIColor(hex: 0x363c4c) // 54 60 76
            static let personal = UIColor(hex: 0x45d788) // 69 215 136
            static let professional = UIColor(hex: 0x209cff) // 32 156 255
        }
        
        struct Chart {
            
            static let ringPath = UIColor(hex: 0xf5f5f5)
            static let gradientColors = [UIColor(hex: 0xf83124), UIColor(hex: 0x50c0ad), UIColor(hex: 0x02b245)]
            
            struct Stats {
                static let dragger = UIColor(hex: 0x7f8691)
                static let background = UIColor(hex: 0x495264)
                static let contentActive = UIColor(hex: 0xffffff)
                static let contentInactive = UIColor(hex: 0xa9abb1)
                static let path = UIColor(hex: 0x7c838e)
                static let low = UIColor(hex: 0xe3201c)
                static let medium = UIColor(hex: 0xffec00)
                static let high = UIColor(hex: 0x50e393)
            }
        }
    }
    
    struct Font {

        static func prometoRegular(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Prometo", size: size)! }
        static func prometoLight(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Prometo-Light", size: size)! }
        static func prometoBold(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Prometo-Bold", size: size)! }
        static func prometoMedium(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Prometo-Medium", size: size)! }
        static func prometoMediumItalic(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Prometo-MediumItalic", size: size)! }
        
        static func arialRegular(ofSize size: CGFloat) -> UIFont { return UIFont(name: "ArialMT", size: size)! }
        static func arialItalic(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Arial-ItalicMT", size: size)! }
        static func arialBold(ofSize size: CGFloat) -> UIFont { return UIFont(name: "Arial-BoldMT", size: size)! }
    }
}
