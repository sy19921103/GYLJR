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
    
    func setHeight(height: CGFloat) {
     
        var f = self.frame
        f.size.height = height
        self.frame = f
    }
}
