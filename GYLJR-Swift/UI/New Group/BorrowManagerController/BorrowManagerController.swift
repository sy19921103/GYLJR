//
//  BorrowManagerController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/13.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class BorrowManagerController: BaseViewController, UITableViewDelegate, UITableViewDataSource  {

    var tableView: BaseTableView!
    var dataArray: Array<BorrowManagerModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "借款管理"
        
        tableView = BaseTableView.init(frame: CGRect(x:0, y:0, width:kScreen_width, height:kScreen_Height-KNavigateBarHeight), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? BorrowManagerCell
        if(cell == nil){
            cell = BorrowManagerCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return ShiPei.CGSizeMakeScaleWith(width: 0, height: 290).height
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
