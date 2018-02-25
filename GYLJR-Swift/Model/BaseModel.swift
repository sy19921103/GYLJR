//
//  BaseModel.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import HandyJSON

class BaseModel: HttpClient {
    
    var dataResult: DataResult!
    var apiManager : ApiManager!
    override init() {
        
        super.init()
        dataResult = DataResult()
        apiManager = ApiManager.shared
    }
    
    typealias ModelCompletionBlock = (DataResult) -> Void
    typealias ModelFailBlock = (Error) -> Void
    typealias ModelPraserBlock = (Data) -> Void
    
    func fetchModelData(modelCompletionBlock: @escaping ModelCompletionBlock,
                              modelFailBlock: @escaping ModelFailBlock,
                            modelPraserBlock: @escaping ModelPraserBlock,
                                  parameters: Dictionary<String, Any>,
                                      urlApi: String
        
    ) -> Void {
        
        fetchHttpData(httpCompletionBlock: { (data) in
            
            let error = self.isSuccessByResponseData(data: data)
            if (error != nil){
                modelFailBlock(error!)
            }else{
                modelPraserBlock(data)
            }
            modelCompletionBlock(self.dataResult)
        },
                      httpFailBlock: { (error) in
                        modelFailBlock(error)
        },
                      parameters: parameters,
                      urlString: kBaseUrl,
                      isPost: true)
    }
    
    func isSuccessByResponseData(data: Data) -> NSError? {
        
        var error :NSError?
        let responseDict = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! Dictionary<String, Any>
        let code = responseDict["error_id"] as! Int
        let message = (responseDict["msg"] is String) ? responseDict["msg"] as! String : ""

        if (code != 0){
            error = NSError(domain: message, code: code, userInfo: nil)
        }
        dataResult.code = code
        dataResult.error = error
        dataResult.message = message
        return error
    }
    
    func getBaseInfoWith<T>(data: Data, type: T) -> BaseInfo<T>{
        
        let jsonStr = String(data: data, encoding: String.Encoding.utf8)
        let baseInfo = JSONDeserializer<BaseInfo<T>>.deserializeFrom(json: jsonStr)
        return baseInfo!
    }
}
