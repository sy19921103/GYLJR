//
//  ReceivableDetailCell.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/13.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ReceivableDetailCell: BaseCell {
    
    typealias DeleteBlock = () -> Void
    
    var receiveableInfo:    ReceivableInfo?
    var idTF:               UITextField!
    var moneyTF:            UITextField!
    var startTimeTF:        UITextField!
    var totalMoneyTF:       UITextField!
    var endTimeTF:          UITextField!
    var deleteBlock:        DeleteBlock!
    var inputVW:            UIView!
    var deleteBtn:          UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kBgColor
        
        deleteBtn = Tool.createImgBtnWith(imageName: "mine_new_borrow_delete", frame: ShiPei.CGRectMakeScaleWith(x: 335, y: 10, width: 20, height: 20), imageScale: 1, addWidth: 5)
        deleteBtn.addTarget(self, action: #selector(deleteClick), for: UIControlEvents.touchUpInside)
        contentView.addSubview(deleteBtn)
        
        inputVW = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 40, width: 375, height: 200))
        inputVW.backgroundColor = kBgColor
        contentView.addSubview(inputVW)
        
        //发票号码
        idTF = Tool.createTextFieldWith(placeHolder: "请完整填写发票号码", target: nil, isSecurity: false, leftWidth: 20)
        idTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 39)
        idTF.backgroundColor = kWhiteColor
        inputVW.addSubview(idTF)
        
        //发票金额
        moneyTF = Tool.createTextFieldWith(placeHolder: "请完整填写发票金额", target: nil, isSecurity: false, leftWidth: 20)
        moneyTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 40, width: 375, height: 39)
        moneyTF.backgroundColor = kWhiteColor
        inputVW.addSubview(moneyTF)
        
        let moneyUnitLB = Tool.createLabelWith(title: "元", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.right, isFitFont: true)
        moneyUnitLB.frame = ShiPei.CGRectMakeScaleWith(x: 300, y: 0, width: 55, height: 39)
        moneyTF.addSubview(moneyUnitLB)

        //开出日期
        let startTimeBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 80, width: 375, height: 39))
        startTimeBtn.addTarget(self, action: #selector(timePickerClickWith(_:)), for: UIControlEvents.touchUpInside)
        startTimeBtn.info = "start"
        startTimeBtn.backgroundColor = kWhiteColor
        inputVW.addSubview(startTimeBtn)
        
        startTimeTF = Tool.createTextFieldWith(placeHolder: "请选择开出日期", target: nil, isSecurity: false, leftWidth: 20)
        startTimeTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 39)
        startTimeTF.isUserInteractionEnabled = false
        startTimeBtn.addSubview(startTimeTF)
        
        let startTimeArrowIV = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 335, y: 10, width: 20, height: 20))
        startTimeArrowIV.image = UIImage(named: "mine_rightArrow")
        startTimeBtn.addSubview(startTimeArrowIV)
        
        //总金额
        totalMoneyTF = Tool.createTextFieldWith(placeHolder: "请完整填写应收账款总金额", target: nil, isSecurity: false, leftWidth: 20)
        totalMoneyTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 120, width: 375, height: 39)
        totalMoneyTF.backgroundColor = kWhiteColor
        inputVW.addSubview(totalMoneyTF)
        
        let totalMoneyUnitLB = Tool.createLabelWith(title: "元", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.right, isFitFont: true)
        totalMoneyUnitLB.frame = ShiPei.CGRectMakeScaleWith(x: 300, y: 0, width: 55, height: 39)
        
        //到期日
        let endTimeBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 160, width: 375, height: 39))
        endTimeBtn.addTarget(self, action: #selector(timePickerClickWith(_:)), for: UIControlEvents.touchUpInside)
        endTimeBtn.backgroundColor = kWhiteColor
        endTimeBtn.info = "end"
        inputVW.addSubview(endTimeBtn)
        
        endTimeTF = Tool.createTextFieldWith(placeHolder: "请选择开出日期", target: nil, isSecurity: false, leftWidth: 20)
        endTimeTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 39)
        endTimeTF.isUserInteractionEnabled = false
        endTimeBtn.addSubview(endTimeTF)
        
        let endTimeArrowIV = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 335, y: 10, width: 20, height: 20))
        endTimeArrowIV.image = UIImage(named: "mine_rightArrow")
        endTimeBtn.addSubview(endTimeArrowIV)
        
    }
    
    func fetchDataWith(_ info: inout ReceivableInfo, index: Int) {
        
        if index == 0 {
            deleteBtn.isHidden = true
            inputVW.setY(0)
        }else {
            deleteBtn.isHidden = false
            inputVW.setY(40*kScreenScale)
        }
    }
    
    @objc private func timePickerClickWith(_ sender: UIButton) {
        
        if (sender.info as! String) == "start" {
            
            SYDatePickView.shared(datePickBlock: { [unowned self] (dateStr) in
                
                self.startTimeTF.text = dateStr
            })
            
        }else {
            
            SYDatePickView.shared(datePickBlock: {  [unowned self] (dateStr) in
                
                self.endTimeTF.text = dateStr
            })
        }
    }
    
    @objc private func deleteClick() {
        
        deleteBlock()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
