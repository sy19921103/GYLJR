//
//  MineViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: BaseTableView!
    var sectionArray: Array<String> = ["账户总览","基本设置","贷前管理","贷后管理"]
    let rowArray: Array<Array<String>?> = [nil,nil,["借款管理","新建借款申请"],["已放款未结清的借款","已结清的借款"]]
    
    
    func checkLoginInfo() {
//        if(ApiManager.shared.loginInfo == nil){
//
//            let loginVC = LoginViewController()
//            navigationController?.pushViewController(loginVC, animated: false)
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.isHiddenTabBarWith(isHidden: false, isAnimated: false)
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "我的"
        checkLoginInfo()
        initUI()
    }
    
    func initUI()
    {
        tableView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height:kScreen_Height-kTabBarHeight-kStatusBarHeight) , style: UITableViewStyle.grouped)
        tableView.delegate = self;
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func generateHeaderView() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionView = tableView.headerView(forSection: section) as! MineHeaderFootView
        
        
        if sectionView.isSelected {
            if (sectionArray[section]["state"] == "open"){
                return rowArray[section]!.count
            }else{
                return 0
            }
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionId = "sectionId"
        
        var headView = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionId) as? MineHeaderFootView
        if headView == nil {
            headView = MineHeaderFootView(reuseIdentifier: sectionId, title: sectionArray[section])
        }
        headView?.showMoreBlock = {
            tableView.reloadRows(at: , with: UITableViewRowAnimation.automatic)
        }
        return headView
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? MineCell
        if (cell == nil){
          cell =  MineCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        }
        cell?.title = rowArray[indexPath.section]![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45*kScreenScale
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60*kScreenScale
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
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
