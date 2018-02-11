//
//  DataResult.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class DataResult: NSObject {

    var dataInfoArray :Array<Any>?
    var dataInfoDict :Dictionary<String, Any>!
    var error :NSError?
    var message :String!
    var code :Int!
    var json :Any?

}
