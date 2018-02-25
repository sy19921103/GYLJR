//
//  String+Help.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

import Foundation
import RNCryptor

extension String{
    
    func md5Encodeing() -> String {
        
        let cStr = self.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    func aes128Encrypt(key: String) -> String {

        let data = self.data(using: String.Encoding.utf8)
        let encodeData = RNCryptor.encrypt(data: data!, withPassword: key)
        return String.init(data: encodeData, encoding: String.Encoding.utf8) ?? ""
    }
}


