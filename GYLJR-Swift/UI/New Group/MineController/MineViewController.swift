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
    var userLabel: UILabel!
    var sectionArray: Array<String> = ["账户总览","基本设置","贷前管理","贷后管理"]
    var sectionStateArray: Array<String> = ["close","close","close","close"]
    let rowArray: Array<Array<String>?> = [nil,nil,["借款管理","新建借款申请"],["已放款未结清的借款","已结清的借款"]]
    
    
    func checkLoginInfo() {
        
//        if(ApiManager.shared.loginInfo == nil){
        
            let loginVC = LoginViewController()
            navigationController?.pushViewController(loginVC, animated: false)
//        }else{
//            
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
        ApiManager.shared.loginInfo?.addObserver(self, forKeyPath: loginNameKey, options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        CLog(11111)
        checkLoginInfo()
    }
    
    func initUI()
    {
        tableView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height:kScreen_Height-kTabBarHeight-kStatusBarHeight) , style: UITableViewStyle.grouped)
        tableView.delegate = self;
        tableView.dataSource = self
        tableView.sectionFooterHeight = 0
        tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
        view.addSubview(tableView)

        generateHeaderView()
    }
    
    func generateHeaderView() {
        
        let headerBgIV = UIImageView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 247))
        headerBgIV.image = UIImage(named: "mine_headerBg")
        headerBgIV.isUserInteractionEnabled = true
        
        let titleLabel = Tool.createLabelWith(title: "个人中心", textColor: kWhiteColor, bgColor: nil, textFont: 16, textAlignment: NSTextAlignment.center, isFitFont: true)
        titleLabel.font = Tool.fitFontWith(font: 18, isBold: true)
        titleLabel.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 50, width: 375, height: 25)
        headerBgIV.addSubview(titleLabel)
        
        userLabel = Tool.createLabelWith(title: "欢迎！<账户名>", textColor: kWhiteColor, bgColor: nil, textFont: 18, textAlignment: NSTextAlignment.center, isFitFont: true)
        userLabel.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 110, width: 375, height: 20)
        headerBgIV.addSubview(userLabel)
        
        let applyBtn = UIButton()
        applyBtn.setBackgroundImage(UIImage(named: "mine_apply"), for: UIControlState.normal)
        applyBtn.addTarget(self, action: #selector(applyMoneyClick), for: UIControlEvents.touchUpInside)
        headerBgIV.addSubview(applyBtn)
        applyBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(60*kScreenScale)
            make.bottom.equalToSuperview().offset(-30*kScreenScale)
            make.width.equalTo(200*kScreenScale)
        }
    
        tableView.tableHeaderView = headerBgIV
    }
    
    @objc func applyMoneyClick() {
        CLog("apply")
        kUserModel.loginBy(mobile: "11111", password: "111111", modelCompletionBlock: { (dataResult) in
            
            
        }) { (error) in
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rowArray[section] != nil {
            if sectionStateArray[section] != "close" {
                return rowArray[section]!.count
            }
            return 0
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
        if(rowArray[section] != nil){
            if(sectionStateArray[section] == "close"){
                headView?.isSelected = false
            }else{
                headView?.isSelected = true
            }
        }
        headView?.index = section
        headView?.showMoreBlock = { (index) in
            
            if(index == 0){
                
            }else if (index == 1){
                let vc = SettingViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                if self.sectionStateArray[index] == "close"{
                    self.sectionStateArray[index] = "open"
                }else{
                    self.sectionStateArray[index] = "close"
                }
            tableView.reloadSections(IndexSet.init(integer: index) , with: UITableViewRowAnimation.automatic)
            }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2{
            
            if indexPath.row == 0{
                
                let vc = BorrowManagerController()
                navigationController?.pushViewController(vc, animated: true)

            }else if indexPath.row == 1{
                
                let vc = ApplyBorrowViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
            
        }else if indexPath.section == 3{
            if indexPath.row == 0{
                
            }else if indexPath.row == 1{
                
            }
        }
    }
    
    deinit {
        ApiManager.shared.loginInfo?.removeObserver(self, forKeyPath: loginNameKey)
    }

}
