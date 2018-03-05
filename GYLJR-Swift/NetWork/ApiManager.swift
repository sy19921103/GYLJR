//
//  ApiManager.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/8.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

let loginNameKey = "loginNameKey"

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    
    let registerApi = "/co_user/info/register"
    let loginApi = "/co_user/info/login"
    var loginInfo :LoginInfo? {
        
        didSet {
            Utlity.saveToSandboxWith(loginInfo, loginNameKey)
        }
    }

    private override init() {
     
        loginInfo = Utlity.readFromSandboxWith(loginNameKey) as? LoginInfo
    }
    
}
