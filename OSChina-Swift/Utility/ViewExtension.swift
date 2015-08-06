//
//  ViewExtension.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/6.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setCorner(#cornerRadius:CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}