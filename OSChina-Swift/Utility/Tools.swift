//
//  Tools.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/6.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import Foundation
import UIKit
class Tools {
    class func setCorner(view:UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6
    }
}