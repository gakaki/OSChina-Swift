//
//  MenuButton.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/6.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    var toFrame:CGRect?
    var fromFrame:CGRect?
   override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
      required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI() {
        self.backgroundColor = UIColor.randomColor()
        self.setCircleCorner()
    }
}


