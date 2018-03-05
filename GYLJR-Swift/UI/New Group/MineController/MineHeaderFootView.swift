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
    typealias sectionClickBlock = (Int) ->Void
    
    var index: Int!
    var title: String!
    private var arrowIV: UIImageView!
    var showMoreBlock: sectionClickBlock!
    var isSelected: Bool = false
    {
        didSet{
            if isSelected {
                arrowIV.transform = CGAffineTransform(rotationAngle: .pi/2)
            }
        }
    }
    
    init(reuseIdentifier: String?, title: String!) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.title = title
        initUI()
    }
    
    func initUI() {
        
        let bgBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 60))
        bgBtn.backgroundColor = kWhiteColor
        bgBtn.addTarget(self, action: #selector(sectionClick(sender:)), for: UIControlEvents.touchUpInside)
        contentView.addSubview(bgBtn)
        
        let titleLabel = Tool.createLabelWith(title: title, textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont: true)
        titleLabel.frame = ShiPei.CGRectMakeScaleWith(x: 15, y: 20, width: 200, height: 20)
        bgBtn.addSubview(titleLabel)
        
        arrowIV = UIImageView(image: UIImage(named: "mine_rightArrow"))
        arrowIV.frame = ShiPei.CGRectMakeScaleWith(x: 340, y: 20, width: 20, height: 20)
        bgBtn.addSubview(arrowIV)
        
        let line = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        line.backgroundColor = kLineColor
        bgBtn.addSubview(line)
    }
    
    @objc func sectionClick(sender: UIButton) {
        
        showMoreBlock(index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
