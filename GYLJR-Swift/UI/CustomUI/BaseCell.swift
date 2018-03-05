//
//  BaseCell.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

protocol BaseCellDelegate {
    
}

class BaseCell: UITableViewCell {

    
    var arrowIV: UIImageView!
    var cellSwitch: UISwitch!
    var isShowArrow: Bool = false {
        didSet {
            if(isShowArrow){
                
                arrowIV = UIImageView(image: UIImage(named: "mine_rightArrow"))
                contentView.addSubview(arrowIV!)
                arrowIV.snp.makeConstraints({ (make) in
                    make.centerY.equalToSuperview()
                    make.right.equalToSuperview().offset(-15*kScreenScale)
                    make.width.equalTo(20*kScreenScale)
                    make.height.equalTo(20*kScreenScale)
                })
            }
        }
    }
    var isShowSwitch: Bool = false {
        
        didSet {
            if(isShowSwitch){
                
                cellSwitch! = UISwitch()
                contentView.addSubview(cellSwitch!)
                cellSwitch?.snp.makeConstraints({ (make) in
                    make.centerX.equalToSuperview()
                    make.right.equalToSuperview().offset(-65*kScreenScale)
                    make.width.equalTo(50*kScreenScale)
                    make.height.equalTo(20*kScreenScale)
                })
            }
        }
    }
    
    var isShowsSeparatorLine: Bool = false {
        
        didSet{
            if(isShowsSeparatorLine){
                
                let lineView = UIView()
                lineView.backgroundColor = kLineColor
                contentView.addSubview(lineView)
                lineView.snp.makeConstraints({ (make) in
                    
                    make.bottom.equalToSuperview().offset(-1*kScreenScale)
                    make.left.equalToSuperview()
                    make.width.equalToSuperview()
                    make.height.equalTo(1*kScreenScale)
                })
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
