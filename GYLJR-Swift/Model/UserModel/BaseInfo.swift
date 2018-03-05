//
//  BaseInfo.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/24.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import HandyJSON

class BaseInfo<T:Any>: HandyJSON {
    
    var code: Int = -1
    var msg: T!
    var time: String!
    required init() {}
}
