//
//  BorrowManagerCell.swift
//  GYLJR-Swift
//
//  Created by shenyi on 2018/2/20.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class BorrowManagerCell: BaseCell {

    
    private var companyNameLB: UILabel!
    private var agreementLB: UILabel!
    private var moneyLB: UILabel!
    private var timeLB: UILabel!
    private var stateLabel: UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kWhiteColor
        
        companyNameLB = Tool.createLabelWith(title: "买方公司：上海可口可乐公司", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        companyNameLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 20, width: 335, height: 20);
        self.contentView.addSubview(companyNameLB)
        
        agreementLB = Tool.createLabelWith(title: "商务合同编号：12381290830128309", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        agreementLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 60, width: 335, height: 20);
        self.contentView.addSubview(agreementLB)
        
        moneyLB = Tool.createLabelWith(title: "申请融资总金额：1900000000", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        moneyLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 100, width: 335, height: 20);
        self.contentView.addSubview(moneyLB)
        
        timeLB = Tool.createLabelWith(title: "时间：2018-01-10 10：00：00", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        timeLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 140, width: 335, height: 20);
        self.contentView.addSubview(timeLB)
        
        stateLabel = Tool.createLabelWith(title: "状态：未提交", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        stateLabel.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 180, width: 335, height: 20);
        self.contentView.addSubview(stateLabel)
        
        let previewBtn = Tool.createButtonWith(title: "预览《保理业务申请书》", textColor: kGoldColor, bgColor: nil, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(previewApplyAgreementClick))
        previewBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 220, width: 200, height: 50)
        previewBtn.showBorder(color: kGoldColor)
        self.contentView.addSubview(previewBtn)
        isShowsSeparatorLine = true
    }
    
    
    @objc func previewApplyAgreementClick(){
        CLog("preview")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}
