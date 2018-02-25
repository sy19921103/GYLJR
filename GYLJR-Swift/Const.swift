//
//  Const.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

import Foundation
import UIKit

let kScreen_width = UIScreen.main.bounds.size.width
let kScreen_Height = UIScreen.main.bounds.size.height
let kScreenScale = kScreen_width/375
//let kBaseUrl = "http://www.gylapi.com"
let kBaseUrl = "http://www.ylfcf.com/API/to_api.php"
let kUserModel = UserModel()
let kIsIphoneX = ((kScreen_Height == 812) ? true:false)
let kTabBarHeight = CGFloat((kIsIphoneX ? 68.0 : 48.0))
let KNavigateBarHeight = CGFloat((kIsIphoneX ? 84.0 : 64.0))
let kStatusBarHeight = CGFloat((kIsIphoneX ? 40.0 : 0))


let kTextBlackColor = kFuncColor(r: 70, g: 70, b: 70, alpha: 1)
let kTextColor = kFuncColor(r: 140, g: 140, b: 140, alpha: 1)
let kGoldColor = kFuncColor(r: 217, g: 167, b: 78, alpha: 1)
let kWhiteColor = UIColor.white
let kBlackColor = UIColor.black
let kLineColor = kFuncColor(r: 230, g: 230, b: 230, alpha: 1)
let kBgColor = kFuncColor(r: 246, g: 247, b: 249, alpha: 1)











