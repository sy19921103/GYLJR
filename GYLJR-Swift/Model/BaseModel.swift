//
//  BaseModel.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class BaseModel: HttpClient {
    
    var dataResult: DataResult!
    var apiManager : ApiManager!
    override init() {
        
        super.init()
        dataResult = DataResult()
        apiManager = ApiManager.shared
    }
    
    typealias ModelCompletionBlock = (DataResult) -> Void
    typealias ModelFailBlock = (NSError) -> Void
    typealias ModelPraserBlock = (Data) -> DataResult
    
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
            }
            let result = modelPraserBlock(data)
            modelCompletionBlock(result)
        },
                      httpFailBlock: { (error) in
                        modelFailBlock(error)
        },
                      parameters: parameters,
                      urlString: kBaseUrl+urlApi,
                      isPost: true)
    }
    
    func isSuccessByResponseData(data: Data) -> NSError? {
        
        var error :NSError?
        let responseDict = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! Dictionary<String, Any>
        let code = responseDict["error_id"] as! Int
        let message = (responseDict["message"] is String) ? responseDict["message"] as! String : ""

        if (code != 0){
            error = NSError(domain: message, code: code, userInfo: nil)
        }
        
        dataResult.dataInfoDict = responseDict
        dataResult.code = code
        dataResult.error = error
        dataResult.message = message
    
        return error
    }
    
    func dictFromResponseData(data: Data) -> Dictionary<String, Any>! {
        
        let responseDict = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! Dictionary<String, Any>
        print(responseDict)
        if(responseDict["msg"] is Dictionary<String, Any>){
            return responseDict["msg"] as! Dictionary<String, Any>
        }else{
            return nil
        }
    }

}
