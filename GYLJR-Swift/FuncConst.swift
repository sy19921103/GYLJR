//
//  FuncConst.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

import Foundation
import UIKit

func kFuncColor(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}
//func CLog(_ message: Any...) {
//    
//    #if DEBUG
//        
//        print(message)
//        
//    #endif
//}

func CLog(_ message:Any..., file:String = #file, function:String = #function,
           line:Int = #line) {
    #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        print("\(fileName):\(line) 方法：\(function) 信息：\(message)")
    #endif
}

