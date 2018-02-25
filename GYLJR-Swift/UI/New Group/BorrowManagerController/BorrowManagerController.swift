//
//  BorrowManagerController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/13.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import HandyJSON

class BorrowManagerController: BaseViewController {

    var tableView: BaseTableView!
    var dataArray: Array<BorrowManagerModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "借款管理"
        let jsonString = "{\"id\":12345,\"color\":\"black\",\"cats\":[{\"age\":1},{\"age\":2}]}"
        if let cat = JSONDeserializer<Cat>.deserializeFrom(json: jsonString) {
            print(cat.age)
        }
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

class Animal: HandyJSON {
    var id: String!
    var color: String?
    var cats: Array<Any>?
    required init() {}
}
class Cat: Animal {
    var age: Int?
    required init() {}
}

