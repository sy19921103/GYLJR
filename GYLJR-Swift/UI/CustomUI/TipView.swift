//
//  TipView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/14.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class TipView {

    static var tipView: TipView?
    
    var message: String! {
        
        didSet {
            
            let size = message.boundingRect(with: ShiPei.CGSizeMakeScaleWith(width: 345, height: 50), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:tipLabel.font], context: nil).size
            
            tipLabel.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-40*kScreenScale)
                make.width.equalTo((size.width+20)*kScreenScale)
                make.height.equalTo((size.height+20)*kScreenScale)
            }
            tipLabel.layer.cornerRadius = (size.height+20)/2*kScreenScale
            tipLabel.isHidden = false
            tipLabel.alpha = 1
            tipLabel.text = message
            
            UIView.animate(withDuration: 4, animations: {
                
                self.tipLabel.alpha = 0.5
                
            }) { (completion) in
                
                self.tipLabel.alpha = 0
                self.tipLabel.isHidden = true
            }

        }
    }
    
    var tipLabel: UILabel!
    
    static func shared() -> TipView {
        
        if tipView == nil {
            tipView = TipView()
        }
        return tipView!
    }
    
    init() {
        
        tipLabel = Tool.createLabelWith(title: message, textColor: kWhiteColor, bgColor: kFuncColor(r: 140, g: 140, b: 140, alpha: 1), textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        tipLabel.layer.masksToBounds = true
        
        UIApplication.shared.keyWindow?.addSubview(tipLabel)
        
    }

}
