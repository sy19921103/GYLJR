//
//  ApplyBorrowViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/5.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ApplyBorrowViewController: BaseViewController {

    var mainSV: BaseScrollView!
    var headerView: UIView!
    var chooseBusinessView: ChooseBusinessView?
    var applyView: ApplyView?
    var handMaterialView: HandMaterialView?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "新建借款申请"
        initUI()
    }
    
    func initUI() {
        
        mainSV = BaseScrollView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height-kBottomSpaceHeight-KNavigateBarHeight))
        view.addSubview(mainSV)
        
        headerView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 120))
        mainSV.addSubview(headerView)
        
        //选择融资业务
        let lineWidth = CGFloat((375-100-25*3)/2)
        
        let chooseLB = Tool.createLabelWith(title: "1", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        chooseLB.frame = ShiPei.CGRectMakeScaleWith(x: 50, y: 20, width: 25, height: 25)
        chooseLB.layer.cornerRadius = 25*kScreenScale/2
        chooseLB.tag = 2
        headerView.addSubview(chooseLB)
        
        let chooseTitleLB = Tool.createLabelWith(title: "选择融资\n业务", textColor: kGoldColor, bgColor: nil, textFont: 13, textAlignment: NSTextAlignment.center, isFitFont: true)
        chooseTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 30, y: 50, width: 65, height: 40)
        chooseTitleLB.numberOfLines = 0
        chooseTitleLB.tag = 3
        headerView.addSubview(chooseTitleLB)
        
        let headLine1 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 75, y: 32.5, width: lineWidth, height: 1))
        headLine1.backgroundColor = kLineColor
        headerView.addSubview(headLine1)
        
        //填写融资申请
        let applyLB = Tool.createLabelWith(title: "2", textColor: kWhiteColor, bgColor: kTextColor, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        applyLB.frame = ShiPei.CGRectMakeScaleWith(x: 50+25+lineWidth, y: 20, width: 25, height: 25)
        applyLB.layer.cornerRadius = 25*kScreenScale/2
        applyLB.tag = 4
        headerView.addSubview(applyLB)
        
        let applyTitleLB = Tool.createLabelWith(title: "填写融资\n业务", textColor: kTextColor, bgColor: nil, textFont: 13, textAlignment: NSTextAlignment.center, isFitFont: true)
        applyTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 30+25+lineWidth, y: 50, width: 65, height: 40)
        applyTitleLB.numberOfLines = 0
        applyTitleLB.tag = 5
        headerView.addSubview(applyTitleLB)
        
        let headLine2 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 75+25+lineWidth, y: 32.5, width: lineWidth, height: 1))
        headLine2.backgroundColor = kLineColor
        headerView.addSubview(headLine2)
        
        //上传必需材料
        let materialLB = Tool.createLabelWith(title: "3", textColor: kWhiteColor, bgColor: kTextColor, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        materialLB.frame = ShiPei.CGRectMakeScaleWith(x: 50+(25+lineWidth)*2, y: 20, width: 25, height: 25)
        materialLB.layer.cornerRadius = 25*kScreenScale/2
        materialLB.tag = 6
        headerView.addSubview(materialLB)
        
        let materialTitleLB = Tool.createLabelWith(title: "上传必需的材料", textColor: kTextColor, bgColor: nil, textFont: 13, textAlignment: NSTextAlignment.center, isFitFont: true)
        materialTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 30+(25+lineWidth)*2, y: 50, width: 65, height: 40)
        materialTitleLB.numberOfLines = 0
        materialTitleLB.tag = 7
        headerView.addSubview(materialTitleLB)
        
        changeViewWith(0, isNext: false)
    }
    
    func changeViewWith(_ index: Int, isNext: Bool)  {
        
        var currentIndex = 0
        if isNext {
            currentIndex = index+1
        }else {
            if index > 0 {
                currentIndex = index-1
            }
        }
        
        let lastLabel = headerView.viewWithTag(2+index*2) as! UILabel
        let lastTitleLabel = headerView.viewWithTag(3+index*2) as! UILabel
        
        lastLabel.backgroundColor = kTextColor
        lastTitleLabel.textColor = kTextColor
        
        let currentLabel = headerView.viewWithTag(2+currentIndex*2) as! UILabel
        let currentTitleLabel = headerView.viewWithTag(3+currentIndex*2) as! UILabel
        
        currentLabel.backgroundColor = kGoldColor
        currentTitleLabel.textColor = kGoldColor
        
        if currentIndex == 0 {
            
            if chooseBusinessView == nil {
                chooseBusinessView = ChooseBusinessView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 120, width: 375, height: 300))
                chooseBusinessView!.chooseNextClick = { 
            
                    self.changeViewWith(0, isNext: true)
                }
                mainSV.addSubview(chooseBusinessView!)
            }
            chooseBusinessView?.isHidden = false
            applyView?.isHidden = true
            
        }else if currentIndex == 1 {
            
            if applyView == nil {
                applyView = ApplyView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 120, width: 375, height: 600))
                mainSV.addSubview(applyView!)
            }
            applyView?.isHidden = false
            chooseBusinessView?.isHidden = true
            handMaterialView?.isHidden = true
            mainSV.contentSize = ShiPei.CGSizeMakeScaleWith(width: 0, height: 1000)
            
        }else if currentIndex == 2 {
            
            if handMaterialView == nil {
                handMaterialView = HandMaterialView()
            }
            handMaterialView?.isHidden = false
            applyView?.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
