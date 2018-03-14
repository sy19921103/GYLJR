//
//  ChooseBusinessView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/5.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ChooseBusinessView: UIView {

    typealias NextClick = () -> Void
    
    var typeDataArray = ["请选择","应收账款融资","承兑汇票融资"]
    var businessBtn: UIButton!
    var chaseView: UIView!
    var type: String?
    var businessTypeView: PullDownTableView!
    var businessSelectedView: UIImageView!
    var chooseNextClick: NextClick!
    
    private var currentBusinessIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    func initUI() {
        
        //保理业务
        let businessView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 10, width: 375, height: 50))
        addSubview(businessView)
        
        let checkBoxBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 30, y: 12.5, width: 25, height: 25))
        checkBoxBtn.addTarget(self, action: #selector(checkBoxClickWith(_:)), for: UIControlEvents.touchUpInside)
        checkBoxBtn.setBackgroundImage(UIImage(named: "register_select"), for: UIControlState.normal)
        checkBoxBtn.isSelected = true
        businessView.addSubview(checkBoxBtn)
        
        let businessTitleLB = Tool.createLabelWith(title: "保理融资业务:", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        businessTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 60, y: 15, width: 110, height: 20)
        businessView.addSubview(businessTitleLB)
        
//        businessBtn = Tool.createButtonWith(title: "  请选择", textColor: kTextColor, bgColor: kWhiteColor, textFont: 14, isFitFont: true, cornRadius: 0, target: self, action: #selector(showTypeViewClick(_:)))
//        businessBtn.frame = ShiPei.CGRectMakeScaleWith(x: 170, y: 0, width: 175, height: 50)
//        businessBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
//        businessBtn.showBorder(color: kFuncColor(r: 190, g: 190, b: 190, alpha: 1))
//        businessView.addSubview(businessBtn)
//        
//        let businessArrowIV = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 135, y: 15, width: 20, height: 20))
//        businessArrowIV.image = UIImage(named: "mine_rightArrow")
//        businessBtn.addSubview(businessArrowIV)
        
        //业务类型
        businessTypeView = PullDownTableView(frame: ShiPei.CGRectMakeScaleWith(x: 170, y: 10, width: 175, height: 50), dataArray: ["请选择","应收账款融资","承兑汇票融资"], delegate: self, leftViewWidth: 10*kScreenScale, cellHeight: 20*kScreenScale, cellClickBlock: { (index) in
            
            if index == 0 {
                self.type = nil
            }else {
                self.type = self.typeDataArray[index]
            }
        })
        
        //是否有追索权
        chaseView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 80, width: 375, height: 30))
        addSubview(chaseView)
        let chaseTitleLB = Tool.createLabelWith(title: "是否有追索权：", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        chaseTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 30, y: 0, width: 110, height: 30)
        chaseView.addSubview(chaseTitleLB)
        
        let chaseSelectBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 140, y: 0, width: 70, height: 30))
        chaseSelectBtn.isSelected = true
        chaseSelectBtn.tag = 8
        chaseSelectBtn.addTarget(self, action: #selector(chaseClickWith(_:)), for: UIControlEvents.touchUpInside)
        chaseView.addSubview(chaseSelectBtn)
        
        let chaseSelectIV = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 5, width: 20, height: 20))
        chaseSelectIV.image = UIImage(named: "mine_new_borrow_selected")
        chaseSelectIV.tag = 10
        chaseSelectBtn.addSubview(chaseSelectIV)
        
        let chaseSelectLB = Tool.createLabelWith(title: "有", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        chaseSelectLB.frame = ShiPei.CGRectMakeScaleWith(x: 25, y: 0, width: 40, height: 30)
        chaseSelectLB.tag = 11
        chaseSelectBtn.addSubview(chaseSelectLB)
        
        let chaseUnselectBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 240, y: 0, width: 70, height: 30))
        chaseUnselectBtn.isSelected = false
        chaseUnselectBtn.tag = 9
        chaseUnselectBtn.addTarget(self, action: #selector(chaseClickWith(_:)), for: UIControlEvents.touchUpInside)
        chaseView.addSubview(chaseUnselectBtn)
        
        let chaseUnselectIV = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 5, width: 20, height: 20))
        chaseUnselectIV.image = UIImage(named: "mine_new_borrow_unselected")
        chaseUnselectIV.tag = 10
        chaseUnselectBtn.addSubview(chaseUnselectIV)
        
        let chaseUnselectLB = Tool.createLabelWith(title: "无", textColor: kTextColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        chaseUnselectLB.frame = ShiPei.CGRectMakeScaleWith(x: 25, y: 0, width: 40, height: 30)
        chaseUnselectLB.tag = 11
        chaseUnselectBtn.addSubview(chaseUnselectLB)
        
        
        //下一步
        let nextBtn = Tool.createButtonWith(title: "下一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(nextClick))
        nextBtn.frame = ShiPei.CGRectMakeScaleWith(x: 30, y: 250, width: 315, height: 50)
        addSubview(nextBtn)
        
    }
    
    func updateUI() {
        
        
    }
    
    @objc func chaseClickWith(_ sender: UIButton) {

        
        if sender.isSelected {
    
            return
        }
        
        var lastIndex = 8

        if sender.tag == 8 {
            
            lastIndex = 9
        }
        let lastChaseBtn = chaseView.viewWithTag(lastIndex) as! UIButton
        lastChaseBtn.isSelected = false
        let lastChaseIV = lastChaseBtn.viewWithTag(10) as! UIImageView
        lastChaseIV.image = UIImage(named: "mine_new_borrow_unselected")
        let lastChaseLB = lastChaseBtn.viewWithTag(11) as! UILabel
        lastChaseLB.textColor = kTextColor
        
        sender.isSelected = true
        let currentChaseIV = sender.viewWithTag(10) as! UIImageView
        currentChaseIV.image = UIImage(named: "mine_new_borrow_selected")
        let currentChaseLB = sender.viewWithTag(11) as! UILabel
        currentChaseLB.textColor = kTextBlackColor
        
    }
    
    @objc func showTypeViewClick(_ sender: UIButton) {
        
        businessTypeView.isHidden = false
        bringSubview(toFront: businessTypeView)
    }
    
    @objc func checkBoxClickWith(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            sender.setBackgroundImage(UIImage(named: "register_unselect"), for: UIControlState.normal)
        }else {
            sender.isSelected = true
            sender.setBackgroundImage(UIImage(named: "register_select"), for: UIControlState.normal)
        
        }
    }
    
    @objc func nextClick() {
        
        chooseNextClick()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
