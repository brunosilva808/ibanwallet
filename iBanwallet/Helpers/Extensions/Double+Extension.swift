//
//  Double+Extension.swift
//  SmartDrive
//
//  Created by William Gomes on 20/09/2018.
//  Copyright © 2018 Bruno Silva by Bold. All rights reserved.
//

import Foundation

extension Double {
    
    func percentage() -> Double {
        return self > 0 ? self / 100 : 0
    }
}
