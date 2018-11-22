//
//  UIButton+Extensions.swift
//  SmartDrive
//
//  Created by Artem Umanets on 13/08/2018.
//  Copyright © 2018 Carbon by Bold. All rights reserved.
//

import UIKit

public enum DeviceScreenSize {
    case iPhone_4_0 
    case iPhone_4_7
    case iPhone_5_5
    case iPhone_5_8
    
    case iPad_7_9
    case iPad_9_7
    case iPad_10_5
    case iPad_12_9
    
    case simulator
    case other
}

public extension UIDevice {
 
    static var screenSize: DeviceScreenSize = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPhone5,1", "iPhone5,2", "iPhone5,3", "iPhone5,4", "iPhone6,1", "iPhone6,2", "iPhone8,4": return .iPhone_4_0
        case "iPhone7,2", "iPhone8,1", "iPhone9,1", "iPhone9,3", "iPhone10,1", "iPhone10,4": return .iPhone_4_7
        case "iPhone7,1", "iPhone8,2", "iPhone9,2", "iPhone9,4", "iPhone10,2", "iPhone10,5": return .iPhone_5_5
        case "iPhone10,3", "iPhone10,6": return .iPhone_5_8
            
        case "i386", "x86_64": return .simulator
        default: return .other
        }
    }()
}
