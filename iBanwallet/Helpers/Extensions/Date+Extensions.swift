//
//  Date+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 14/11/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import Foundation

extension Date {
    
    func timeInterval(since pastDate: Date) -> TimeInterval {
        return self.timeIntervalSinceReferenceDate - pastDate.timeIntervalSinceReferenceDate
    }
    
    func byAdding(days: Int) -> Date {
        var dayComp = DateComponents()
        dayComp.day = days
        let date = Calendar.current.date(byAdding: dayComp, to: self)
        return date ?? self
    }
    
    func difference(in unit: Calendar.Component, to date: Date) -> Int {
        let calendar = Calendar.current
        
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([unit], from: date1, to: date2)
        return components.value(for: unit) ?? 0
    }
}
