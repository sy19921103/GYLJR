//
//  SettingViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    var isVertifyCompany: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "基本设置"
        initUI()
    }
    
    func initUI() {
        
        //手机认证
        let mobileBgBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 65))
        mobileBgBtn.backgroundColor = kWhiteColor
        view.addSubview(mobileBgBtn)
        
        let mobileIcon = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 20, y: 20, width: 25, height: 25))
        mobileIcon.image = UIImage(named: "mine_setting_mobile")
        mobileIcon.isUserInteractionEnabled = true
        mobileBgBtn.addSubview(mobileIcon)
        
        let mobileLB = Tool.createLabelWith(title: "手机认证", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont: true)
        mobileLB.frame = ShiPei.CGRectMakeScaleWith(x: 55, y: 20, width: 200, height: 25)
        mobileBgBtn.addSubview(mobileLB)
        
        let mobileStateLB = Tool.createLabelWith(title: "已认证", textColor: kFuncColor(r: 5, g: 118, b: 0, alpha: 1), bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        mobileBgBtn.addSubview(mobileStateLB)
        mobileStateLB.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20*kScreenScale)
            make.centerY.equalToSuperview()
            make.height.equalTo(25*kScreenScale)
        }
        
        let mobileCorrectIV = UIImageView(image: UIImage(named: "mine_setting_correct"))
        mobileCorrectIV.isUserInteractionEnabled = true
        mobileBgBtn.addSubview(mobileCorrectIV)
        mobileCorrectIV.snp.makeConstraints { (make) in
            make.right.equalTo(mobileStateLB.snp.left).offset(-8*kScreenScale)
            make.centerY.equalToSuperview()
            make.width.equalTo(20*kScreenScale)
            make.height.equalTo(20*kScreenScale)
        }
        
        let line1 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 64, width: 375, height: 1))
        line1.backgroundColor = kLineColor
        mobileBgBtn.addSubview(line1)
        
        
        //企业认证
        let companyBgBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 66, width: 375, height: 65))
        companyBgBtn.backgroundColor = kWhiteColor
        companyBgBtn.addTarget(self, action: #selector(handCompanyMeterialClick), for: UIControlEvents.touchUpInside)
        view.addSubview(companyBgBtn)
        
        let companyIcon = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 20, y: 20, width: 25, height: 25))
        companyIcon.image = UIImage(named: "mine_setting_id")
        companyIcon.isUserInteractionEnabled = true
        companyBgBtn.addSubview(companyIcon)
        
        let companyLB = Tool.createLabelWith(title: "企业身份", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont: true)
        companyLB.frame = ShiPei.CGRectMakeScaleWith(x: 55, y: 20, width: 200, height: 25)
        companyBgBtn.addSubview(companyLB)
        
        let companyArrowIV = UIImageView(image: UIImage(named: "mine_rightArrow"))
        companyArrowIV.isUserInteractionEnabled = true
        companyBgBtn.addSubview(companyArrowIV)
        companyArrowIV.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20*kScreenScale)
            make.centerY.equalToSuperview()
            make.height.equalTo(20*kScreenScale)
            make.width.equalTo(20*kScreenScale)
        }
        
        let companyStateLB = Tool.createLabelWith(title: "材料待上传", textColor: kFuncColor(r: 250, g: 73, b: 71, alpha: 1), bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.left, isFitFont: true)
        companyBgBtn.addSubview(companyStateLB)
        companyStateLB.snp.makeConstraints { (make) in
            make.right.equalTo(companyArrowIV.snp.left).offset(-8*kScreenScale)
            make.centerY.equalToSuperview()
            make.height.equalTo(25*kScreenScale)
        }
        
        let companyCorrectIV = UIImageView(image: UIImage(named: "mine_setting_issue"))
        companyCorrectIV.isUserInteractionEnabled = true
        companyBgBtn.addSubview(companyCorrectIV)
        companyCorrectIV.snp.makeConstraints { (make) in
            make.right.equalTo(companyStateLB.snp.left).offset(-8*kScreenScale)
            make.centerY.equalToSuperview()
            make.width.equalTo(20*kScreenScale)
            make.height.equalTo(20*kScreenScale)
        }
        
        let line2 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 64, width: 375, height: 1))
        line2.backgroundColor = kLineColor
        companyBgBtn.addSubview(line2)
        
        
        //修改密码
        let pwdBgBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 132, width: 375, height: 65))
        pwdBgBtn.addTarget(self, action: #selector(jumpToResetPwdView), for: UIControlEvents.touchUpInside)
        pwdBgBtn.backgroundColor = kWhiteColor
        view.addSubview(pwdBgBtn)

        let pwdIcon = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 20, y: 20, width: 25, height: 25))
        pwdIcon.image = UIImage(named: "mine_setting_pwd")
        pwdIcon.isUserInteractionEnabled = true
        pwdBgBtn.addSubview(pwdIcon)

        let pwdLB = Tool.createLabelWith(title: "修改密码", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont: true)
        pwdLB.frame = ShiPei.CGRectMakeScaleWith(x: 55, y: 20, width: 200, height: 25)
        pwdBgBtn.addSubview(pwdLB)

        let pwdArrowIV = UIImageView(image: UIImage(named: "mine_rightArrow"))
        pwdArrowIV.isUserInteractionEnabled = true
        pwdBgBtn.addSubview(pwdArrowIV)
        pwdArrowIV.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20*kScreenScale)
            make.centerY.equalToSuperview()
            make.height.equalTo(20*kScreenScale)
            make.width.equalTo(20*kScreenScale)
        }

        let line3 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 64, width: 375, height: 1))
        line3.backgroundColor = kLineColor
        companyBgBtn.addSubview(line3)
    }
    
    @objc func handCompanyMeterialClick() {
        
        let vc = CompanyGeneralViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func jumpToResetPwdView() {
        
        let vc = ResetPwdViewController()
        navigationController?.pushViewController(vc, animated: true)
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
