//
//  UIButton+Help.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

import Foundation
import UIKit

private var key: Void?

extension UIButton {
    
    @IBInspectable var info: String? {
        get {
            return objc_getAssociatedObject(self, &key) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
