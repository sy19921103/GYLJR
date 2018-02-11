//
//  ShiPei.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ShiPei: NSObject {

    static func CCRectMakeScaleWith(x: CGFloat, y:CGFloat, width:CGFloat, height:CGFloat) -> CGRect{
        
        let rect = CGRect(x: kScreenScale*x, y: kScreenScale*y, width: kScreenScale*width, height: height*kScreenScale)
    
        return rect
    }
}
