//
//  UITextField+Help.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/8.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

extension UITextField {
 
    func addTopLine()  {
        
        let topView = UIView(frame: bounds)
        topView.backgroundColor = kLineColor
        topView.setHeight(1*kScreenScale)
        addSubview(topView)
    }
    
    func addBottomLine() {
        
        let bottomView = UIView(frame: bounds)
        bottomView.backgroundColor = kLineColor
        bottomView.setHeight(1*kScreenScale)
        bottomView.setY(frame.size.height-1*kScreenScale)
        addSubview(bottomView)
    }
}
