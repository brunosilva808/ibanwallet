//
//  String+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 16/08/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation
import UIKit

extension String {

    func attributed() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
    
//    static func formatted(digits value: Int) -> String {
//        if value < 10 { return "0\(value)" }
//        return "\(value)"
//    }
//    
//    static func formatted(distance value: Int) -> String {
//        return "\(value) \(l("Global.DistanceMetric"))"
//    }
//    
//    static func formatted(speed value: Int) -> String {
//        return "\(value) \(l("Global.SpeedMetric"))"
//    }
//    
//    static func formatted(score value: Int?) -> String {
//        if let score = value { return "\(score)" }
//        return "-"
//    }

//    static func formatted(duration minutes: Int, short: Bool = false) -> String {
//        var result = ""
//        var remainMinutes = minutes
//        let hours = Int(Double(remainMinutes) / 60.0)
//        
//        if hours > 0 {
//            result = "\(hours)\(l("Global.HourShort")) "
//            remainMinutes -= (hours * 60)
//        }
//        let prefix = short ? l("Global.MinutesShort") : l("Global.MinutesMedium")
//        let minutesStr = remainMinutes < 10 ? "0\(remainMinutes)" : "\(remainMinutes)"
//        result += "\(minutesStr)\(prefix)"
//        return result
//    }
//    
//    static func formattedTimeWith(duration seconds: Int) -> String {
//        let time = (days: (seconds / 3600) / 24, hours: (seconds / 3600) % 24, minutes: (seconds % 3600) / 60, seconds: (seconds % 3600) % 60)
//        
//        var result = ""
//        if time.days > 0 {
//            result = "\(time.days)" + (time.days > 1 ? l("Global.Days") : l("Global.Day")) + " "
//            if time.hours > 0 { result += "\(time.hours)\(l("Global.HourShort")) " }
//            result += (time.minutes <= 9 ? "0" : "") + "\(time.minutes)\(l("Global.MinutesShort"))"
//        } else {
//            if time.hours > 0 { result += "\(time.hours)\(l("Global.HourShort")):" }
//            result += (time.minutes <= 9 ? "0" : "") + "\(time.minutes)\(l("Global.MinutesShort")):"
//            result += (time.seconds <= 9 ? "0" : "") + "\(time.seconds)\(l("Global.SecondsMedium"))"
//        }
//        return result
//    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
    
    func replacingFirstOccurrence(of string: String, with replacement: String) -> String {
        guard let range = self.range(of: string) else { return self }
        return self.replacingCharacters(in: range, with: replacement)
    }
}
