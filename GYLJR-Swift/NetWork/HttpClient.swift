//
//  HttpClient.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import Alamofire

class HttpClient: NSObject {

    var name :String?
    typealias HttpCompletionBlock = (Data) -> Void
    typealias HttpFailBlock = (Error) -> Void
    
    func fetchHttpData(httpCompletionBlock: @escaping HttpCompletionBlock,
                             httpFailBlock: @escaping HttpFailBlock,
                                 parameters: Dictionary<String,Any>?,
                                 urlString: String,
                                    isPost: Bool
                                   
        ) {
        CLog("url",urlString)
        CLog("parameter",parameters)
        if isPost {
            Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (response) in
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("response() = \(utf8Text.replaceUnicode())")
                }
                
                if(response.error != nil){
                    httpFailBlock(response.error!)
                }else{
                    httpCompletionBlock(response.data!)
                }
            }
        }else{
            Alamofire.request(urlString)
        }
    }
}
