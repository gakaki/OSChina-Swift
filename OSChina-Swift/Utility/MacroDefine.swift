//
//  MacroDefine.swift
//  OSChina-Swift
//
//  Created by 王云鹏 on 15/8/5.
//  Copyright (c) 2015年 王云鹏. All rights reserved.
//

import Foundation
import UIKit

let kScreenWidth    = UIScreen.mainScreen().bounds.size.width
let kScreenHeight   = UIScreen.mainScreen().bounds.size.height



func kIS_IOS7() ->Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0 }
func kIS_IOS8() -> Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0 }












//MARK:Color
//let selectedTitleColor:UIColor =