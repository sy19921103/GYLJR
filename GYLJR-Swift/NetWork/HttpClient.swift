//
//  HttpClient.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/7.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class HttpClient: NSObject {

    var name :String?
    typealias HttpCompletionBlock = (Data) -> Void
    typealias HttpFailBlock = (NSError) -> Void
    
    func fetchHttpData(httpCompletionBlock: @escaping HttpCompletionBlock,
                             httpFailBlock: @escaping HttpFailBlock,
                                 parameters: Dictionary<String,Any>?,
                                 urlString: String,
                                    isPost: Bool
                                   
        ) {
        let session = URLSession.shared
        let serUrl = URL(string: urlString)
        var request = URLRequest(url: serUrl!);
        request.httpBody = getBody(parameters: parameters!)?.data(using: String.Encoding.utf8)
        if(isPost){
            request.httpMethod = "POST"
        }else {
            request.httpMethod = "GET"
        }
        print(urlString)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if (error != nil) {
                httpFailBlock(error! as NSError)
                print(error!.localizedDescription)
            }else{
                let resposeObject = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(resposeObject!)
                httpCompletionBlock(data!)
            }
        }
        
        dataTask.resume();
    }
    
    func getBody(parameters: Dictionary<String, Any>) -> String? {
        
        var body = "";
        for (key, value) in parameters {
            
            let str = "\(key)=\(value)&"
            body = body+str
        }
        print(body)
        if body.count > 1 {
            body.removeLast()
            return body
        }else{
            return nil
        }
    }
}
