//
//  ClickLabel.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/10.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ClickTextView: UIView {
    
    static func createClickTextView(contentStr: String, clickStrArray: Array<String>, foregroundColor: UIColor, textColor: UIColor) -> UITextView {
        print(clickStrArray)
        
        let contentAttrStr: NSMutableAttributedString = NSMutableAttributedString.init(string: contentStr)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byCharWrapping
        paragraphStyle.lineSpacing = 5*kScreenScale
        contentAttrStr.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, contentAttrStr.length))
        contentAttrStr.addAttribute(NSAttributedStringKey.foregroundColor, value: textColor, range:NSMakeRange(0, contentAttrStr.length))
        
        let ocStr = contentStr as NSString
        var i = 1
        for clickStr in clickStrArray {
            
            let range = ocStr.range(of: clickStr, options: String.CompareOptions.regularExpression, range: NSMakeRange(0, ocStr.length))
            contentAttrStr.addAttribute(NSAttributedStringKey.link, value: "index"+String(i,radix: 10)+"://", range: range)
            i += 1
        }
        let textView = UITextView();
        textView.attributedText = contentAttrStr
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.linkTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: foregroundColor]
        
        return textView
    }
}
