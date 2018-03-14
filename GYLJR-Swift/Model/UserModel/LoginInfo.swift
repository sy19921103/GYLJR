//
//  LoginInfo.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/24.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class LoginInfo: ResponseInfo, NSCoding {
    
    var id: String!
    var co_name: String!
    var legal_person: String?
    var mobile: String!
    var yyzz_code: String?
    var jgxy_code: String?
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(id, forKey: "id")
        aCoder.encode(co_name, forKey: "co_name")
        aCoder.encode(legal_person, forKey: "legal_person")
        aCoder.encode(mobile, forKey: "mobile")
        aCoder.encode(yyzz_code, forKey: "yyzz_code")
        aCoder.encode(jgxy_code, forKey: "jgxy_code")
    }
    
    required init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id           = aDecoder.decodeObject(forKey: "id") as? String
        self.co_name      = aDecoder.decodeObject(forKey: "co_name") as? String
        self.mobile       = aDecoder.decodeObject(forKey: "mobile") as! String
        self.yyzz_code    = aDecoder.decodeObject(forKey: "yyzz_code") as? String
        self.jgxy_code    = aDecoder.decodeObject(forKey: "jgxy_code") as? String
        self.legal_person = aDecoder.decodeObject(forKey: "legal_persom") as? String
    }
    
}
