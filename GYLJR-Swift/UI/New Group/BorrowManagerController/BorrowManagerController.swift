//
//  BorrowManagerController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/13.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class BorrowManagerController: BaseViewController {

    var tableView: BaseTableView!
    var dataArray: Array<BorrowManagerModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "借款管理"
        
        
        
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
