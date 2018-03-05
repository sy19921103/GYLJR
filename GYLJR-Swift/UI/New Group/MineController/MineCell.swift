//
//  MineCell.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class MineCell: BaseCell {

    private var titleLabel :UILabel!

    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = kFuncColor(r: 249, g: 245, b: 235, alpha: 1)
        titleLabel = Tool.createLabelWith(title: "", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        titleLabel.frame = ShiPei.CGRectMakeScaleWith(x: 15, y: 15, width: 200, height: 15)
        contentView.addSubview(titleLabel)
        
        let line = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 10, y: 44, width: 350, height: 1))
        line.backgroundColor = kLineColor
        contentView.addSubview(line)
        
        isShowArrow = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
