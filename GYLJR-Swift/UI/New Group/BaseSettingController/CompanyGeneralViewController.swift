//
//  CompanyGeneralViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class CompanyGeneralViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var tableView: BaseTableView!
    var companyInfoArray: Array<String> = ["","","","","","",""]
    let defaultArray = ["请完整填写企业的名称","请完整填写企业法人的姓名","请完整填写企业的营业执照号","请完整填写企业的开户许可证号","请完整填写收款银行","请完整填写企业的收款银行账号","请完整填写企业的机构信用代码（选填）"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "基本设置"
        initUI()
    }
    
    func initUI() {
        
        tableView = BaseTableView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height-KNavigateBarHeight), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = kBgColor
        view.addSubview(tableView)
        
        let headerView = UIView.init(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 15))
        headerView.backgroundColor = kBgColor
        tableView.tableHeaderView = headerView
        
        let line = UIView.init(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 14, width: 375, height: 0.8))
        line.backgroundColor = kFuncColor(r: 210, g: 210, b: 210, alpha: 1)
        headerView.addSubview(line)
        
        let footerView = UIView.init(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 120))
        footerView.backgroundColor = kBgColor
        tableView.tableFooterView = footerView
        
        let nextBtn = Tool.createButtonWith(title: "下一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(nextStepClick))
        nextBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 50, width: 335, height: 50)
        footerView.addSubview(nextBtn)
        
    }
    
    @objc func nextStepClick() {
        
        let vc = CompanyMaterialViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        if checkInputInfo() != nil {
            
            createTipAlertViewWith(checkInputInfo()!)
            
        }else{
            
            
        }
        
    }
    
    func checkInputInfo() -> String? {
        
    
        if companyInfoArray[0] == "" {
            return "请输入企业名称"
        } else if companyInfoArray[1] == "" {
            return "请输入企业法人的姓名"
        } else if companyInfoArray[2] == "" {
            return "请输入企业的营业执照号"
        } else if companyInfoArray[3] == "" {
            return "请输入企业的开户许可证号"
        } else if companyInfoArray[4] == "" {
            return "请输入收款银行"
        } else if companyInfoArray[5] == "" {
            return "请输入收款银行账户"
        } else if companyInfoArray[6] == "" {
            return "请输入企业的机构信用代码"
        }
        
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return defaultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CompanyGeneralCell
        if cell == nil {
            cell = CompanyGeneralCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        cell?.companyTF.placeholder = defaultArray[indexPath.row]
        cell?.companyTF.delegate = self
        cell?.companyTF.tag = indexPath.row
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70*kScreenScale
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        companyInfoArray[textField.tag] = textField.text ?? ""
        return true
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
