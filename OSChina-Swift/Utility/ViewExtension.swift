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
    
    
    /**
    *  切圆
    */
     func setCircleCorner() {
       // self.layer.masksToBounds = true
        self.layer.cornerRadius = self.height()/2
    }
    

    /**
    *  快速读取坐标以及大小
    */
    func height() ->CGFloat {
        return self.frame.size.height
    }
    func width() ->CGFloat {
        return self.frame.size.width
    }
    func x() ->CGFloat {
        return self.frame.origin.x
    }
    func y() ->CGFloat {
        return self.frame.origin.y
    }
    
}