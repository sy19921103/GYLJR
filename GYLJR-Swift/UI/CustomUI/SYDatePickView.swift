//
//  DatePickView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/13.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class SYDatePickView {
    
    typealias DatePickBlock = (String) -> Void
    
    static  var datePickView:   SYDatePickView?
    private var datePicker:     UIDatePicker!
    private var datePickBlock:  DatePickBlock!
    private var bgView:         UIView!

    static func shared(datePickBlock: @escaping DatePickBlock)  {
    
        if (datePickView == nil) {
            datePickView = SYDatePickView()
        }
        datePickView!.datePickBlock = datePickBlock
        datePickView!.bgView.isHidden = false
    }
    
    init() {
        
        bgView = UIView(frame: CGRect(x: 0, y: kScreen_Height-kBottomSpaceHeight-240*kScreenScale, width: kScreen_width, height: 240*kScreenScale))
        bgView.backgroundColor = kWhiteColor
        UIApplication.shared.keyWindow?.addSubview(bgView)

        let line = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 1))
        line.backgroundColor = kLineColor
        bgView.addSubview(line)

        let cancelBtn = Tool.createButtonWith(title: "取消", textColor: kTextBlackColor, bgColor: nil, textFont: 16, isFitFont: true, cornRadius: 0, target: self, action: #selector(cancelClick))
        cancelBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 100, height: 40)
        bgView.addSubview(cancelBtn)

        
        let sureBtn = Tool.createButtonWith(title: "确定", textColor: kTextBlackColor, bgColor: nil, textFont: 16, isFitFont: true, cornRadius: 0, target: self, action: #selector(sureClick))
        sureBtn.frame = ShiPei.CGRectMakeScaleWith(x: 275, y: 0, width: 100, height: 40)
        bgView.addSubview(sureBtn)

        let line1 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 39, width: 375, height: 1))
        line1.backgroundColor = kLineColor
        bgView.addSubview(line1)

        datePicker = UIDatePicker(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 40, width: 375, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.backgroundColor = kWhiteColor
        datePicker.datePickerMode = .date
        bgView.addSubview(datePicker)
    }
    
    @objc func cancelClick() {
        
        bgView.isHidden = true
    }
    
    @objc func sureClick() {
        
        bgView.isHidden = true
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        datePickBlock(formatter.string(from: datePicker.date))
    }
    
    
}
