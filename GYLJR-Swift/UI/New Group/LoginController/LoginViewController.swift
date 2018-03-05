//
//  LoginViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {

    var userTF: UITextField!
    var pwdTF: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        isHiddenTabBarWith(isHidden: true, isAnimated: false)
        addLeftButtonWith(imageName: "nav_close", tapSel: #selector(backToLast))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "登录"
        initUI()
    }
    
    func initUI() {
        
        //userView
        let userView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 66))
        view.addSubview(userView)
        
        let userIconIV = UIImageView(image: UIImage(named: "user_icon_login"))
        userIconIV.frame = ShiPei.CGRectMakeScaleWith(x: 15, y: 20, width: 25, height: 25)
        userView.addSubview(userIconIV)
        
        let userline1 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 55, y: 15, width: 1, height: 35 ))
        userline1.backgroundColor = kLineColor
        userView.addSubview(userline1)
        
        userTF = Tool.createTextFieldWith(placeHolder: "用户名/手机号", target: self, isSecurity: false)
        userTF.frame = ShiPei.CGRectMakeScaleWith(x: 60, y: 15, width: 250, height: 35)
        userView.addSubview(userTF)
        
        let userline2 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 65, width: 375, height: 1 ))
        userline2.backgroundColor = kLineColor
        userView.addSubview(userline2)
        
        //pwdView
        let pwdView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 67, width: 375, height: 66))
        view.addSubview(pwdView)
        
        let pwdIconIV = UIImageView(image: UIImage(named: "pwd_login"))
        pwdIconIV.frame = ShiPei.CGRectMakeScaleWith(x: 15, y: 20, width: 25, height: 25)
        pwdView.addSubview(pwdIconIV)
        
        let pwdline1 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 55, y: 15, width: 1, height: 35 ))
        pwdline1.backgroundColor = kLineColor
        pwdView.addSubview(pwdline1)
        
        pwdTF = Tool.createTextFieldWith(placeHolder: "密码", target: self, isSecurity: true)
        pwdTF.frame = ShiPei.CGRectMakeScaleWith(x: 60, y: 15, width: 250, height: 35)
        pwdView.addSubview(pwdTF)
        
        let pwdline2 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 65, width: 375, height: 1 ))
        pwdline2.backgroundColor = kLineColor
        pwdView.addSubview(pwdline2)
        
        
        //登录
        let bottomView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 180, width: 375, height: 100))
        view.addSubview(bottomView)
        
        let loginBtn = Tool.createButtonWith(title: "立即登录", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 18, isFitFont: true, cornRadius: 5, target: self, action: #selector(loginClick))
        loginBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 0, width: 335, height: 60)
        loginBtn.titleLabel?.font = Tool.fitFontWith(font: 18, isBold: true)
        bottomView.addSubview(loginBtn)
        
        let registBtn = Tool.createButtonWith(title: "我要注册", textColor: kTextBlackColor, bgColor: nil, textFont: 13, isFitFont: true, cornRadius: 0, target: self, action: #selector(registerClick))
        registBtn.frame = ShiPei.CGRectMakeScaleWith(x: 107, y: 80, width: 80, height: 15)
        bottomView.addSubview(registBtn)
        
        let bottomLine = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 187, y: 80, width: 1, height: 15))
        bottomLine.backgroundColor = kLineColor
        bottomView.addSubview(bottomLine)
        
        let forgetBtn = Tool.createButtonWith(title: "忘记密码？", textColor: kTextBlackColor, bgColor: nil, textFont: 13, isFitFont: true, cornRadius: 0, target: self, action: #selector(forgetPwdClick))
        forgetBtn.frame = ShiPei.CGRectMakeScaleWith(x: 188, y: 80, width: 80, height: 15)
        forgetBtn.addTarget(self, action: #selector(forgetPwdClick), for: UIControlEvents.touchUpInside)
        bottomView.addSubview(forgetBtn)

    }
    
    @objc func loginClick() {
        
        userTF.resignFirstResponder()
        pwdTF.resignFirstResponder()
        
        if checkInputInformation() != nil {
            createTipAlertViewWith(checkInputInformation()!)
            return
        }
    
        kUserModel.loginBy(mobile: userTF.text!, password:pwdTF.text!.md5Encodeing(), modelCompletionBlock: { [unowned self] (dataResult) in
            
            if dataResult.code == 0{
                
                let loginInfo = dataResult.dataInfo as! LoginInfo
                ApiManager.shared.loginInfo = loginInfo
                self.navigationController?.popViewController(animated: true)
                
            }else{
                self.createTipAlertViewWith(dataResult.message)
            }
        }) { (error) in
            
        }
    }
    
    func checkInputInformation() -> String? {
        
        if userTF.text == nil {
            return "请输入手机号"
        }
        if pwdTF.text == nil {
            return "请输入密码"
        }
        if !Utlity.checkMobile(userTF.text) {
            return "请输入正确的手机号"
        }
        return Utlity.checkPassword(pwdTF.text)
    }
    
    @objc func registerClick() {
        
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
        CLog("register")

    }
    
    @objc func forgetPwdClick() {
        CLog("forget")
    }
    
}
