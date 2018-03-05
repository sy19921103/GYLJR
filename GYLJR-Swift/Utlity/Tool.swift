//
//  Tool.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class Tool: NSObject {
    
    static func createLabelWith(title: String?, textColor: UIColor?, bgColor: UIColor?, textFont:CGFloat ,textAlignment: NSTextAlignment?, isFitFont: Bool) -> UILabel {
        
        let label = UILabel()
        label.textAlignment = textAlignment ?? NSTextAlignment.left
        if (isFitFont) {
            label.font = UIFont.systemFont(ofSize: textFont)
        }else{
            label.font = fitFontWith(font: textFont, isBold: false)
        }
        label.textColor = textColor ?? kBlackColor
        label.backgroundColor = bgColor ?? UIColor.clear
        label.layer.masksToBounds = true
        label.text = title ?? ""
        
        return label
    }
    
    static func createButtonWith(title: String?, textColor: UIColor?, bgColor: UIColor?, textFont:CGFloat, isFitFont: Bool, cornRadius: CGFloat, target: Any?, action:Selector) -> UIButton {
        
        let btn = UIButton(type: UIButtonType.custom)
        btn.backgroundColor = bgColor ?? UIColor.clear
        if (isFitFont) {
            btn.titleLabel?.font = UIFont.systemFont(ofSize: textFont)
        }else{
            btn.titleLabel?.font = fitFontWith(font: textFont, isBold: false)
        }
        btn.setTitle(title ?? "", for: UIControlState.normal)
        btn.setTitleColor(textColor ?? kBlackColor, for: UIControlState.normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = cornRadius
        btn.addTarget(target, action: action , for: UIControlEvents.touchUpInside)
        
        return btn
    }
    
    static func createTextFieldWith(placeHolder: String?, target:UITextFieldDelegate?, isSecurity: Bool) ->UITextField {
        
        let textField = UITextField()
        textField.placeholder = placeHolder ?? ""
        textField.delegate = target
        textField.isSecureTextEntry = isSecurity
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10*kScreenScale, height: 0))
        textField.leftView?.backgroundColor = kWhiteColor
        textField.leftViewMode = UITextFieldViewMode.always
        textField.borderStyle = UITextBorderStyle.none
        return textField

    }
    
    /// 实际点击区域比较大的按钮
    ///
    /// - Parameters:
    ///   - imageName: <#imageName description#>
    ///   - frame: <#frame description#>
    ///   - imageScale: 图片宽高比
    ///   - addWidth: 增加的宽度
    /// - Returns: <#return value description#>
    
    static func createImgBtnWith(imageName: String, frame: CGRect, imageScale: CGFloat, addWidth: CGFloat) ->UIButton {
        
        var btnRect = CGRect()
        btnRect.origin.x = frame.origin.x-kScreenScale*addWidth/2
        btnRect.origin.y = frame.origin.y-addWidth*imageScale*kScreenScale/2
        btnRect.size = CGSize(width: frame.size.width+addWidth, height: frame.size.height+addWidth*imageScale)

        let btn = UIButton(frame: btnRect)
        
        let imgVW = UIImageView(image: UIImage(named: imageName))
        btn.addSubview(imgVW)
        imgVW.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(frame.size.width)
            make.height.equalTo(frame.size.height)
        }
        
        return btn
    }
    
    static func fitFontWith(font: CGFloat, isBold: Bool) -> UIFont {
        
        if(kScreen_width <= 320){
            if(isBold) {return UIFont.boldSystemFont(ofSize: font)}
            return UIFont.systemFont(ofSize: font)
        }else{
            if(isBold) {return UIFont.systemFont(ofSize: font*kScreenScale)}
            return UIFont.boldSystemFont(ofSize: font*kScreenScale)
        }
    }
    
    
    static func attributeParagraphWith(_ lineSpace: CGFloat, _ string: String) -> NSMutableAttributedString
    {
        let attriStr = NSMutableAttributedString(string: string)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpace*kScreenScale
        attriStr.addAttribute(.paragraphStyle, value: paragraph, range: NSMakeRange(0, string.count))
        
        return attriStr
    }
    
    

}
