//
//  RegisterViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController, UITextFieldDelegate, UITextViewDelegate {

    var userTF: UITextField!
    var pwdTF: UITextField!
    var againPwdTF: UITextField!
    var mobileTF: UITextField!
    var codeTF: UITextField!
    var mobileCodeTF: UITextField!
    var mainScrollView: UIScrollView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addLeftButtonWith(imageName: "nav_close", tapSel: #selector(backToLast))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = kWhiteColor
        title = "注册"
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        
        mainScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height-KNavigateBarHeight))
        view.addSubview(mainScrollView)
        
        //userView
        let userView = UIView()
        mainScrollView.addSubview(userView)
        userView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(60*kScreenScale)
        }
        
        let userTitleLabel = Tool.createLabelWith(title: "用户名", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont:true)
        userTitleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 100, height: 20)
        userView.addSubview(userTitleLabel)
        
        userTF = Tool.createTextFieldWith(placeHolder: "您的账户名或登录名", target: self, isSecurity: false)
        userTF.frame = ShiPei.CCRectMakeScaleWith(x: 100, y: 15, width: 250, height: 30)
        userView.addSubview(userTF)
        
        let userLine = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        userLine.backgroundColor = kLineColor
        userView.addSubview(userLine)
        
        //pwdView
        let pwdView = UIView()
        mainScrollView.addSubview(pwdView)
        pwdView.snp.makeConstraints { (make) in
            make.top.equalTo(userView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(60*kScreenScale)
        }
        
        let pwdTitleLabel = Tool.createLabelWith(title: "设置密码", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont:true)
        pwdTitleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 100, height: 20)
        pwdView.addSubview(pwdTitleLabel)
        
        pwdTF = Tool.createTextFieldWith(placeHolder: "建议至少使用两种字符组合", target: self, isSecurity: false)
        pwdTF.frame = ShiPei.CCRectMakeScaleWith(x: 100, y: 15, width: 250, height: 30)
        pwdView.addSubview(pwdTF)
        
        let pwdLine = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        pwdLine.backgroundColor = kLineColor
        pwdView.addSubview(pwdLine)
        
        //againPwdView
        let againPwdView = UIView()
        mainScrollView.addSubview(againPwdView)
        againPwdView.snp.makeConstraints { (make) in
            make.top.equalTo(pwdView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(60*kScreenScale)
        }
        
        let againPwdTitleLabel = Tool.createLabelWith(title: "确认密码", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont:true)
        againPwdTitleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 100, height: 20)
        againPwdView.addSubview(againPwdTitleLabel)
        
        againPwdTF = Tool.createTextFieldWith(placeHolder: "请再次输入密码", target: self, isSecurity: false)
        againPwdTF.frame = ShiPei.CCRectMakeScaleWith(x: 100, y: 15, width: 250, height: 30)
        againPwdView.addSubview(againPwdTF)
        
        let againPwdLine = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        againPwdLine.backgroundColor = kLineColor
        againPwdView.addSubview(againPwdLine)
        
        //mobileView
        let mobileView = UIView()
        mainScrollView.addSubview(mobileView)
        mobileView.snp.makeConstraints { (make) in
            make.top.equalTo(againPwdView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(60*kScreenScale)
        }
        
        let mobileTitleLabel = Tool.createLabelWith(title: "中国0086", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont:true)
        mobileTitleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 100, height: 20)
        mobileView.addSubview(mobileTitleLabel)
        
        mobileTF = Tool.createTextFieldWith(placeHolder: "建议使用常用手机", target: self, isSecurity: false)
        mobileTF.frame = ShiPei.CCRectMakeScaleWith(x: 100, y: 15, width: 250, height: 30)
        mobileView.addSubview(mobileTF)
        
        let mobileLine = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        mobileLine.backgroundColor = kLineColor
        mobileView.addSubview(mobileLine)
        
        //codeView
        let codeView = UIView()
        mainScrollView.addSubview(codeView)
        codeView.snp.makeConstraints { (make) in
            make.top.equalTo(mobileView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(60*kScreenScale)
        }
        
        let codeTitleLabel = Tool.createLabelWith(title: "验证码", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont:true)
        codeTitleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 100, height: 20)
        codeView.addSubview(codeTitleLabel)
        
        codeTF = Tool.createTextFieldWith(placeHolder: "请输入验证码", target: self, isSecurity: false)
        codeTF.frame = ShiPei.CCRectMakeScaleWith(x: 100, y: 15, width: 250, height: 30)
        codeView.addSubview(codeTF)
        
        let codeLine = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        codeLine.backgroundColor = kLineColor
        codeView.addSubview(codeLine)
        
        //mobileCodeView
        let mobileCodeView = UIView()
        mainScrollView.addSubview(mobileCodeView)
        mobileCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(codeView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(60*kScreenScale)
        }
        
        let mobileCodeTitleLabel = Tool.createLabelWith(title: "手机验证码", textColor: kTextBlackColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.left, isFitFont:true)
        mobileCodeTitleLabel.frame = ShiPei.CCRectMakeScaleWith(x: 15, y: 20, width: 100, height: 20)
        mobileCodeView.addSubview(mobileCodeTitleLabel)
        
        mobileCodeTF = Tool.createTextFieldWith(placeHolder: "请输入手机验证码", target: self, isSecurity: false)
        mobileCodeTF.frame = ShiPei.CCRectMakeScaleWith(x: 100, y: 15, width: 250, height: 30)
        mobileCodeView.addSubview(mobileCodeTF)
        
        let mobileCodeLine = UIView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 59, width: 375, height: 1))
        mobileCodeLine.backgroundColor = kLineColor
        mobileCodeView.addSubview(mobileCodeLine)
        
        
        //bottomView
        let bottomView = UIView()
        mainScrollView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(mobileCodeView.snp.bottom).offset(20*kScreenScale)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(140*kScreenScale)
        }
        
        let registerBtn = Tool.createButtonWith(title: "立即注册", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 18, isFitFont: true, cornRadius: 5, target: self, action: #selector(registerClick))
        registerBtn.frame = ShiPei.CCRectMakeScaleWith(x: 20, y: 0, width: 335, height: 60)
        registerBtn.titleLabel?.font = Tool.fitFontWith(font: 18, isBold: true)
        bottomView.addSubview(registerBtn)
        
        let agreeCheckBox = Tool.createImgBtnWith(imageName: "select_register", frame: ShiPei.CCRectMakeScaleWith(x: 25, y: 80, width: 20, height: 20), imageScale: 1, addWidth: 5)
        agreeCheckBox.addTarget(self, action: #selector(checkBoxClick(sender:)), for: UIControlEvents.touchUpInside)
        bottomView.addSubview(agreeCheckBox)
        
        
        let agreementTV = ClickTextView.createClickTextView(contentStr: "我已阅读并同意《元亨祥金控用户注册协议》和《隐私政策》", clickStrArray: ["《元亨祥金控用户注册协议》","《隐私政策》"], foregroundColor: kGoldColor, textColor: kTextColor)
        agreementTV.frame = ShiPei.CCRectMakeScaleWith(x: 53, y: 75, width: 270, height: 55)
        agreementTV.delegate = self
        agreementTV.font = Tool.fitFontWith(font: 13, isBold: false)
        bottomView.addSubview(agreementTV)
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "index1" {
            
            return false
        }
        if URL.scheme == "index2" {
            
            return false
        }
        return true
    }
    
    
    @objc func registerClick() {
        CLog("register")
        
        kUserModel.registerBy(mobile: mobileTF.text!, password: pwdTF.text!.md5Encodeing(), companyName: "11111111", modelCompletionBlock: { (dataResult) in
            
        }) { (error) in
            
        }
    }
    
    @objc func checkBoxClick(sender: UIButton) {
        CLog("check")
    }
    
    @objc func registerAgreementClick() {
        CLog("registerAgreement")
    }
    @objc func privateAgreementClick() {
        CLog("private")
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
