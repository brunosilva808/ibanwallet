//
//  NSAttributedString+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 16/08/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation
import UIKit

public extension NSAttributedString {
    
    public var bolded: NSAttributedString {
        return applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }

    public var underlined: NSAttributedString {
        return applying(attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }

    public var struckthrough: NSAttributedString {
        return applying(attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }

    public var attributes: [NSAttributedString.Key: Any] {
        return attributes(at: 0, effectiveRange: nil)
    }
    
    func set(string: String, asLinkURL linkURL: String) -> NSAttributedString {
        let mutableAttributed = NSMutableAttributedString(attributedString: self)
        let foundRange = mutableAttributed.string.range(of: string)
        
        if let stringRange = foundRange {
            let range = NSRange(stringRange, in: mutableAttributed.string)
            mutableAttributed.addAttribute(.link, value: linkURL, range: range)
            return mutableAttributed
        }
        return self
    }
    
    func with(attribute: NSAttributedString.Key, value: Any) -> NSAttributedString {
        
        let mutableAttrStr = NSMutableAttributedString(attributedString: self)
        mutableAttrStr.addAttribute(attribute, value: value, range: NSRange(location: 0, length: mutableAttrStr.string.count))
        return mutableAttrStr
    }
    
    func with(font: UIFont) -> NSAttributedString { return self.with(attribute: .font, value: font) }
    func with(color: UIColor) -> NSAttributedString { return self.with(attribute: .foregroundColor, value: color) }
    func underline() -> NSAttributedString { return self.with(attribute: .underlineStyle, value: 1) }
}

// MARK: - Methods
public extension NSAttributedString {
    
    /// SwifterSwift: Applies given attributes to the new instance of NSAttributedString initialized with self object
    ///
    /// - Parameter attributes: Dictionary of attributes
    /// - Returns: NSAttributedString with applied attributes
    fileprivate func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes(attributes, range: range)
        
        return copy
    }
    
    public func colored(with color: UIColor) -> NSAttributedString {
        return applying(attributes: [.foregroundColor: color])
    }
    
    public func applying(attributes: [NSAttributedString.Key: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }
        
        let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
        let result = NSMutableAttributedString(attributedString: self)
        
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        
        return result
    }

    public func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"
        
        return applying(attributes: attributes, toRangesMatching: pattern)
    }
}

// MARK: - Operators
public extension NSAttributedString {
    
    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add to.
    ///   - rhs: NSAttributedString to add.
    public static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }
    
    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add.
    ///   - rhs: NSAttributedString to add.
    /// - Returns: New instance with added NSAttributedString.
    public static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }
    
    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add to.
    ///   - rhs: String to add.
    public static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }
    
    /// SwifterSwift: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
    ///
    /// - Parameters:
    ///   - lhs: NSAttributedString to add.
    ///   - rhs: String to add.
    /// - Returns: New instance with added NSAttributedString.
    public static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }
}
