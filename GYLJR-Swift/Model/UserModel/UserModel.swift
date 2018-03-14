//
//  UserModel.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/8.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import HandyJSON

class UserModel: BaseModel {
    
    
    func registerBy(mobile: String,
                    password: String,
                    companyName: String,
                    modelCompletionBlock: @escaping ModelCompletionBlock,
                    modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["mobile": mobile, "password": password, "co_name": companyName]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction) in
        },
                             parameters: parameters,
                             urlApi: apiManager.registerApi)
    }
    
    
    func loginBy(mobile: String,
                 password: String,
                 modelCompletionBlock: @escaping ModelCompletionBlock,
                 modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["mobile": mobile, "password": password]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction)  in
                                self.praserLoginUser(data: diction)
        },
                             parameters: parameters,
                             urlApi: apiManager.loginApi)
    }
    
    private func praserLoginUser(data :Data) {
        
        let baseInfo = getBaseInfoWith(data: data, type: LoginInfo())
        dataResult.dataInfo = baseInfo.msg
    }
    
    func resetPwdWith(userId: String,
                      mobile: String,
                      oldPwd: String,
                      newPwd: String,
        modelCompletionBlock: @escaping ModelCompletionBlock,
              modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["id": userId, "mobile": mobile, "password": oldPwd, "newPassword": newPwd]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction) in
                               
        },
                             parameters: parameters,
                             urlApi: ApiManager.shared.resetPwdApi)
    }
    
    
    func updateUserInfoWith(userId: String,
                            companyName: String,
                            legalPerson: String,
                            yyzzCode: String,
                            jgxyCode: String,
                            khxkCode: String,
                            bankName: String,
                            bankCard: String,
                            modelCompletionBlock: @escaping ModelCompletionBlock,
                            modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["id": userId, "co_name": companyName, "legal_person": legalPerson, "yyzz_code": yyzzCode, "jgxy_code": jgxyCode, "khxk_code": khxkCode, "bank_name": bankName, "bank_card": bankCard]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction) in
                
        },
                             parameters: parameters,
                             urlApi: ApiManager.shared.updateInfoApi)
        
    }
    
    func updateUserInfoWith(userId: String,
                            yyzzImg: String,
                            yyzzImgName: String,
                            idFrontImg: String,
                            idFrontImgName: String,
                            idBehindImg: String,
                            idBehindImgName: String,
                            khxkImg: String,
                            khxkImgName: String
        
                            ){
        
        
        
        
    }
    
    
    
}
