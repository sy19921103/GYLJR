//
//  View+Help.swift
//  CustomTabbar
//
//  Created by shenyi on 2018/2/7.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func setX(_ x: CGFloat) {
     
        var f = self.frame
        f.origin.x = x
        self.frame = f
    }
    func setY(_ y: CGFloat) {
        
        var f = self.frame
        f.origin.y = y
        self.frame = f
    }

    func setWidth(_ width: CGFloat) {
        
        var f = self.frame
        f.size.width = width
        self.frame = f
    }

    func setHeight(_ height: CGFloat) {
        
        var f = self.frame
        f.size.height = height
        self.frame = f
    }

    func showBorder(color: UIColor) {
        self.layer.borderWidth = 1*kScreenScale
        self.layer.borderColor = color.cgColor
    }
}
