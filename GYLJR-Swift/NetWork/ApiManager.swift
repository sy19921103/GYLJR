//
//  ApiManager.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/8.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    
    let registerApi = "/co_user/info/register"
    let loginApi = "/co_user/info/login"
    let loginInfo :LoginInfo? = nil

    private override init() {
        
    }
    
}
