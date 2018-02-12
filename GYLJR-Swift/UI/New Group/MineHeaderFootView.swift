//
//  MineHeaderFootView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class MineHeaderFootView: UITableViewHeaderFooterView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    typealias sectionClickBlock = () ->Void
    
    var title: String!
    var showMoreBlock: sectionClickBlock!
    var isSelected: Bool = false
    
    init(reuseIdentifier: String?, title: String!) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.title = title
        initUI()
    }
    
    func initUI() {
        
        let bgBtn = UIButton(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 0, width: 375, height: 60))
        bgBtn.backgroundColor = kWhiteColor
        bgBtn.addTarget(self, action: #selector(sectionClick(sender:)), for: UIControlEvents.touchUpInside)
        
        let titleLabel = Tool.createLabelWith(title: title, textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont: true)
        titleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 200, height: 20)
        bgBtn.addSubview(titleLabel)
        
        let arrowIV = UIImageView(image: UIImage(named: "mine_rightArrow"))
        arrowIV.frame = ShiPei.CCRectMakeScaleWith(x: 340, y: 20, width: 20, height: 20)
        arrowIV.tag = 10
        bgBtn.addSubview(arrowIV)
        
        let line = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 60, width: 375, height: 1))
        line.backgroundColor = kLineColor
        bgBtn.addSubview(line)
    }
    
    @objc func sectionClick(sender: UIButton) {
        
        let arrowIV = sender.viewWithTag(10) as! UIImageView
        if sender.isSelected {
            sender.isSelected = false
            arrowIV.transform = CGAffineTransform(rotationAngle: -.pi/2)
        }else{
            sender.isSelected = true
            arrowIV.transform = CGAffineTransform(rotationAngle: .pi/2)
        }
        isSelected = sender.isSelected
        showMoreBlock()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
