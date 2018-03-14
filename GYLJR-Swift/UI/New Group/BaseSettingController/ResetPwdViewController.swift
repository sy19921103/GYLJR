//
//  ResetPwdViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/14.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ResetPwdViewController: BaseViewController {

    
    var oldPwdTF: UITextField!
    var newPwdTF: UITextField!
    var newAgainPwdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "修改登录密码"
        initUI()
    }
    
    func initUI() {
        
        oldPwdTF = Tool.createTextFieldWith(placeHolder: "请输入原始密码", target: nil, isSecurity: true, leftWidth: 20)
        oldPwdTF.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 60, width: 335, height: 50)
        oldPwdTF.showBorder(color: kGoldColor)
        oldPwdTF.layer.cornerRadius = 5*kScreenScale
        view.addSubview(oldPwdTF)
        
        newPwdTF = Tool.createTextFieldWith(placeHolder: "请输入新密码", target: nil, isSecurity: true, leftWidth: 20)
        newPwdTF.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 120, width: 335, height: 50)
        newPwdTF.showBorder(color: kGoldColor)
        newPwdTF.layer.cornerRadius = 5*kScreenScale
        view.addSubview(newPwdTF)
        
        newAgainPwdTF = Tool.createTextFieldWith(placeHolder: "请确认新密码", target: nil, isSecurity: true, leftWidth: 20)
        newAgainPwdTF.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 180, width: 335, height: 50)
        newAgainPwdTF.showBorder(color: kGoldColor)
        newAgainPwdTF.layer.cornerRadius = 5*kScreenScale
        view.addSubview(newAgainPwdTF)
        
        let tipLB = Tool.createLabelWith(title: "登录密码需由6~16字母数字组成", textColor: kTextColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        tipLB.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 250, width: 375, height: 20)
        view.addSubview(tipLB)
        
        let submitBtn = Tool.createButtonWith(title: "提交", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(submitClick))
        submitBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 300, width: 335, height: 50)
        view.addSubview(submitBtn)
        
    }

    
    @objc func submitClick() {
        
        let result = checkInputInfo()
        if result != nil {
            
            TipView.shared().message = result!

        }else {
            
            kUserModel.resetPwdWith(userId: ApiManager.shared.loginInfo!.id,
                                    mobile: ApiManager.shared.loginInfo!.mobile,
                                    oldPwd: oldPwdTF.text!.md5Encodeing(),
                                    newPwd: newPwdTF.text!.md5Encodeing(),
                                    modelCompletionBlock: { (dataResult) in
                                        
                                        if dataResult.code == 0 {
                                            TipView.shared().message = "修改成功"
                                        }else {
                                            TipView.shared().message = dataResult.message
                                        }
            },
                                    modelFailBlock: { (error) in
                                        
            })
        }
    }
    
    func checkInputInfo() -> String? {
        
        if Utlity.checkPassword(oldPwdTF.text!) != nil {
            return (Utlity.checkPassword(oldPwdTF.text!))
        }
        if Utlity.checkPassword(newPwdTF.text!) != nil {
            return (Utlity.checkPassword(newPwdTF.text!))
        }
        if Utlity.checkPassword(newPwdTF.text!) != nil {
            return (Utlity.checkPassword(newAgainPwdTF.text!))
        }
        
        if(newAgainPwdTF.text! != newPwdTF.text! ){
            return "两次密码输入不一致"
        }
        return nil
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
