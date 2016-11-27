//
//  Colors.swift
//  Spenders
//
//  Created by Matthieu Labarrière on 18/09/2016.
//  Copyright © 2016 mlabarriere. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(rgbaValue: UInt32) {
        let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
        let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
        let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    enum Name : UInt32 {
        case blueAF = 0x192C42FF
        case redAF    = 0xD60907FF
        case orangeAF          = 0xFF732FFF
        case greyF4        = 0xF4F4F4FF
        case greyBold      = 0x8F8E94FF
        case grey4A        = 0x4A4A4AFF
        case grey1A        = 0x1A1A1AFF
    }
    
    convenience init(named name: Name) {
        self.init(rgbaValue: name.rawValue)
    }
}

extension UIColor {
    var isLight: Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.5
    }
}



