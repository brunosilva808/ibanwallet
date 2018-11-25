//
//  DateFormatter+Utils.swift
//  SmartDrive
//
//  Created by Artem Umanets on 16/08/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation

enum DateFormat: String, DateFormatProtocol {
    
    case iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case yyyymmdd = "yyyy-MM-dd"
    
    case dayMedium = "EEE dd/MM"
    case time = "HH:mm"
    case dmy = "dd/MM/yyyy"
    case monthShort = "MMM"
    case dmyShort = "dd/MM/yy"
    case dmyShort2 = "dd-MM-yy"
    case dayMonth = "dd MMM"
}

extension Date {
    func to(_ dateformat: DateFormat) -> String { return self.to(dateformat as DateFormatProtocol) }
    static func from(string: String?, format: DateFormat) -> Date? { return Date.from(string: string, format: format as DateFormatProtocol) }
}

public protocol DateFormatProtocol {
    
    var value: String { get }
}

public extension DateFormatProtocol where Self: RawRepresentable, Self.RawValue == String {
    
    var value: String { return self.rawValue }
}

public extension Date {
    
    private static var sharedFormatters: [String : DateFormatter] = [String : DateFormatter]()
    private static func formatter(for dateFormat: String) -> DateFormatter {
        if let formatter = Date.sharedFormatters[dateFormat] { return formatter }
        else {
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormat
            formatter.locale = Locale(identifier: Locale.preferredLanguages.first ?? "pt_PT")
            formatter.timeZone = TimeZone(identifier: "WET")
            Date.sharedFormatters[dateFormat] = formatter
            return formatter
        }
    }
    
    public func to(_ dateFormat: String) -> String { return Date.formatter(for: dateFormat).string(from: self) }
    public func to(_ dateformat: DateFormatProtocol) -> String { return Date.formatter(for: dateformat.value).string(from: self) }

    public static func from(string: String?, format: DateFormatProtocol) -> Date? {
        guard let dateStr = string else { return nil }
        return Date.formatter(for: format.value).date(from: dateStr)
    }
}
