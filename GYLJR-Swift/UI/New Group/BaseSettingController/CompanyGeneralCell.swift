//
//  CompanyGeneralCell.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class CompanyGeneralCell: BaseCell {

    
    var companyTF: UITextField!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        companyTF = Tool.createTextFieldWith(placeHolder: nil, target: nil, isSecurity: false, leftWidth: 10)
        companyTF.frame = ShiPei.CGRectMakeScaleWith(x: 10, y: 15, width: 330, height: 40)
        contentView.addSubview(companyTF)
        
        isShowsSeparatorLine = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
