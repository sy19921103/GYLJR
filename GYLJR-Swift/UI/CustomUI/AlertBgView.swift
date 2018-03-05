//
//  AlertBgView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/1.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class AlertBgView: UIView {

    var alertView: UIView!
    
    static var bgView: AlertBgView?
    
    static func sharedWith(_ alertView: UIView?) -> AlertBgView? {
    
        if alertView == nil {
            return bgView!
        }
        if bgView == nil {
            bgView = AlertBgView.init(alertView!)
        }else {
            bgView!.setContentView(alertView!)
        }
        return bgView!
    }
    
    private init(_ alertView: UIView) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height) )
        self.alpha = 0.5
        self.backgroundColor = UIColor.black
        
        setContentView(alertView)
    }
    
    private func setContentView(_ alertView: UIView) {
        
        self.alertView = alertView
        UIApplication.shared.keyWindow?.addSubview(self)
        UIApplication.shared.keyWindow?.addSubview(alertView)
        window?.addSubview(alertView)
    }

    func dismiss() {
        alertView.removeFromSuperview()
        isHidden = true
    }
    
    func show() {
        isHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
