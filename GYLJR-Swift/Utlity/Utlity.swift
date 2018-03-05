//
//  Utlity.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class Utlity {

    static func checkMobile(_ phone: String?) -> Bool {
    
        if phone == nil {
            return false
        }
        if phone!.count == 11 {
            return true
        }else {
            return false
        }
    }
    
    static func checkPassword(_ password: String?) -> String? {
        
        if password == nil {
            return "请输入密码"
        }
        let regex = "^[^\\u4e00-\\u9fa5]*$"
        let predicate = NSPredicate(format: "Self matches %@", regex)
        if !predicate.evaluate(with: password) {
            return "密码不得含有中文字符"
        }else {
            
            if password!.count < 6 {
                return "密码不得少于6位"
            }else if password!.count > 16 {
                return "密码不得大于16位"
            }
        }
        return nil
    }
    
    static func checkEmptyString(_ string: String?) {
        
        
        
    }
    
    static func saveToSandboxWith(_ object: Any?, _ key: String) {
        
        if object == nil {
            UserDefaults.standard.removeObject(forKey: key);
            UserDefaults.standard.synchronize()
        }else {
            let data = NSKeyedArchiver.archivedData(withRootObject: object!)
            UserDefaults.standard.set(data, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func readFromSandboxWith(_ key: String) -> Any? {
        
        let data = UserDefaults.standard.object(forKey: key)
        if data != nil {
            let returnData = NSKeyedUnarchiver.unarchiveObject(with: data as! Data)
            return returnData
        }else {
            return nil
        }
    }
    
    static func cleanSandboxWith(_ key: String) {
        
        UserDefaults.standard.set(nil, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
