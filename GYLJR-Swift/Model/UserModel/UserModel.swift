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
    
    
    func registerBy(mobile: String, password: String, companyName: String, modelCompletionBlock: @escaping ModelCompletionBlock, modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["mobile": mobile, "password": password, "co_name": companyName]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction) in
                                self.praserRegisterUser(data: diction)
        },
                             parameters: parameters,
                             urlApi: apiManager.registerApi)
    }
    
    func praserRegisterUser(data :Data) {
        
        
        
    }
    
    func loginBy(mobile: String, password: String, modelCompletionBlock: @escaping ModelCompletionBlock, modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["mobile": mobile, "password": password]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction)  in
                                self.praserLoginUser(data: diction)
        },
                             parameters: parameters,
                             urlApi: apiManager.loginApi)
    }
    
    func praserLoginUser(data :Data) {
        
        let baseInfo = getBaseInfoWith(data: data, type: LoginInfo.self)
        dataResult.dataInfo = baseInfo.msg
    }
    
}
