//
//  UserModel.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/8.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class UserModel: BaseModel {
    
    
    func registerBy(mobile: String, password: String, companyName: String, modelCompletionBlock: @escaping ModelCompletionBlock, modelFailBlock: @escaping ModelFailBlock) {
        
        let parameters = ["mobile": mobile, "password": password, "co_name": companyName]
        
        super.fetchModelData(modelCompletionBlock: modelCompletionBlock,
                             modelFailBlock: modelFailBlock,
                             modelPraserBlock: { (diction) -> DataResult in
                                self.praserRegisterUser(data: diction)
        },
                             parameters: parameters,
                             urlApi: apiManager.registerApi)
    }
    
    func praserRegisterUser(data :Data) -> DataResult {
        
        dataResult.dataInfoDict = super.dictFromResponseData(data: data)
        return dataResult
    }

}
