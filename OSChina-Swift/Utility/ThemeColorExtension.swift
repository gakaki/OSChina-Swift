//
//  ThemeColorExtension.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/6.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /**
    *16进制颜色
    */
   class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
    class func selectTitleColor() -> UIColor{
        return UIColor.UIColorFromRGB(0x209624)
    }
    
    
}



