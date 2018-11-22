//
//  NSMutableAttributedString+Utils.swift
//  SmartDrive
//
//  Created by Artem Umanets on 16/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    //https://stackoverflow.com/questions/28496093/making-text-bold-using-attributed-string-in-swift
    //https://codewithchris.com/common-mistakes-with-adding-custom-fonts-to-your-ios-app/#includefonts
    @discardableResult func bold(_ text: String, size: CGFloat) -> NSMutableAttributedString {
        
        //        for family: String in UIFont.familyNames
        //        {
        //            print("\(family)")
        //            for names: String in UIFont.fontNames(forFamilyName: family)
        //            {
        //                print("== \(names)")
        //            }
        //        }
        
        let attrs: [NSAttributedString.Key: Any] = [.font: Theme.Font.arialBold(ofSize: size)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
    
    func replace(string: String, with attributedString: NSAttributedString) {
        
        if let range = self.string.range(of: string) {
            let nsRange = NSRange(range, in: self.string)
            self.replaceCharacters(in: nsRange, with: attributedString)
        }
    }
}
