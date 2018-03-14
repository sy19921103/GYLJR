//
//  ApplyView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/5.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ApplyView: UIView, UITableViewDelegate, UITableViewDataSource {

    var mainBgView1: UIView!
    var mainBgView2: UIView!
    var companyNameTF: UITextField!
    var agreementIdTF: UITextField!
    var receivableTF: UITextField!
    var timeTF: UITextField!
    var timeUnitTV: PullDownTableView!
    var settleDateTV: PullDownTableView!
    var totalMoneyLB: UILabel!
    var handingChargeLB: UILabel!
    var payWayLabel: UILabel!
    var receivableDetailArray: Array<ReceivableInfo>?
    var receivableTableView: BaseTableView!
    
    private let DateArray: Array<String> = ["请选择每月利息结算日","每月1日","每月2日","每月3日","每月4日","每月5日","每月6日","每月7日","每月8日","每月9日","每月10日","每月11日","每月12日","每月13日","每月14日","每月15日","每月167日","每17日","每月18日","每月19日","每月20日","每月21日","每月22日","每月23日","每月24","每月25日","每月26日","每月27日","每月28日","每月29日","每月30日","每月31日"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        receivableDetailArray = [ReceivableInfo(), ReceivableInfo()]

        initBgView1UI()
        initBgView2UI()
    }
    
    func initBgView1UI() {
        
        mainBgView1 = UIView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: 600))
        addSubview(mainBgView1)
        
        //三个textField
        companyNameTF = Tool.createTextFieldWith(placeHolder: "请完整填写买方公司名称", target: nil, isSecurity: false, leftWidth: 20)
        companyNameTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 50)
        companyNameTF.backgroundColor = kWhiteColor
        companyNameTF.addTopLine()
        mainBgView1.addSubview(companyNameTF)
        
        agreementIdTF = Tool.createTextFieldWith(placeHolder: "请完整填写商务合同名称", target: nil, isSecurity: false, leftWidth: 20)
        agreementIdTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 50, width: 375, height: 50)
        agreementIdTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20*kScreenScale, height: 0))
        agreementIdTF.backgroundColor = kWhiteColor
        agreementIdTF.addTopLine()
        mainBgView1.addSubview(agreementIdTF)
        
        receivableTF = Tool.createTextFieldWith(placeHolder: "请完整填写应收账款总金额", target: nil, isSecurity: false, leftWidth: 20)
        receivableTF.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 100, width: 375, height: 50)
        receivableTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20*kScreenScale, height: 0))
        receivableTF.backgroundColor = kWhiteColor
        receivableTF.addTopLine()
        receivableTF.addBottomLine()
        mainBgView1.addSubview(receivableTF)
        
        let receiveableTitleLB = Tool.createLabelWith(title: "元", textColor: kTextBlackColor, bgColor: nil, textFont: 17, textAlignment: NSTextAlignment.right, isFitFont: true)
        receiveableTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 325, y: 0, width: 30, height: 50)
        receivableTF.addSubview(receiveableTitleLB)
        
        //融资期限
        let financeView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 160, width: 375, height: 150))
        mainBgView1.addSubview(financeView)
        
        let financeTitleLB = Tool.createLabelWith(title: "融资期限：", textColor: kTextBlackColor, bgColor: nil, textFont: 15, textAlignment: NSTextAlignment.left, isFitFont: true)
        financeTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 0, width: 90, height: 50)
        financeView.addSubview(financeTitleLB)
        
        timeTF = Tool.createTextFieldWith(placeHolder: "", target: nil, isSecurity: false, leftWidth: 10)
        timeTF.frame = ShiPei.CGRectMakeScaleWith(x: 110, y: 0, width: 120, height: 50)
        timeTF.showBorder(color: kFuncColor(r: 190, g: 190, b: 190, alpha: 1))
        timeTF.backgroundColor = kWhiteColor
        financeView.addSubview(timeTF)
        
        timeUnitTV = PullDownTableView(frame: ShiPei.CGRectMakeScaleWith(x: 250, y: 0, width: 105, height: 50), dataArray: ["请选择","天","月"], delegate: financeView, leftViewWidth: 10*kScreenScale, cellHeight:20*kScreenScale, cellClickBlock: { (index) in
            
        })
        
        settleDateTV = PullDownTableView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 70, width: 375, height: 50), dataArray: DateArray, delegate: financeView, leftViewWidth: 20*kScreenScale, cellHeight: 20*kScreenScale, cellClickBlock: { (index) in

        })
        
        let tipLB = Tool.createLabelWith(title: "注：如遇节假日提前至上一个工作日支付利息", textColor: kGoldColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        tipLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 130, width: 300, height: 20)
        financeView.addSubview(tipLB)
        
        
        //申请融资总金额
        let moneyView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 320, width: 375, height: 150))
        moneyView.backgroundColor = kWhiteColor
        mainBgView1.addSubview(moneyView)
        
        totalMoneyLB = Tool.createLabelWith(title: "申请融资总金额：200000000元", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        totalMoneyLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 30, width: 300, height: 20)
        moneyView.addSubview(totalMoneyLB)
        
        handingChargeLB = Tool.createLabelWith(title: "手续费：100000元", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        handingChargeLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 70, width: 300, height: 20)
        moneyView.addSubview(handingChargeLB)
        
        payWayLabel = Tool.createLabelWith(title: "融资费用支付方式：按月结息", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: nil, isFitFont: true)
        payWayLabel.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 110, width: 300, height: 20)
        moneyView.addSubview(payWayLabel)
        
        
        //底部按钮
        let bottomView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 520, width: 375, height: 50))
        mainBgView1.addSubview(bottomView)
        
        let itemWidth: CGFloat = (375-40-20)/3
        
        let lastStepBtn = Tool.createButtonWith(title: "上一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(bottomBtnClickWith(_:)))
        lastStepBtn.info = "last"
        lastStepBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 0, width: itemWidth, height: 50)
        bottomView.addSubview(lastStepBtn)
        
        let saveBtn = Tool.createButtonWith(title: "保存", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(bottomBtnClickWith(_:)))
        saveBtn.info = "save"
        saveBtn.frame = ShiPei.CGRectMakeScaleWith(x: 30+itemWidth, y: 0, width: itemWidth, height: 50)
        bottomView.addSubview(saveBtn)
        
        let nextStepBtn = Tool.createButtonWith(title: "下一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 15, isFitFont: true, cornRadius: 5, target: self, action: #selector(bottomBtnClickWith(_:)))
        nextStepBtn.info = "next"
        nextStepBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20+10*2+itemWidth*2, y: 0, width: itemWidth, height: 50)
        bottomView.addSubview(nextStepBtn)
        
    }
    
    func initBgView2UI() {
        
        mainBgView2 = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 1000))
        mainBgView2.isHidden = true
        addSubview(mainBgView2)
        
        let headerView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 40))
        headerView.backgroundColor = kBgColor
        
        let titleLB = Tool.createLabelWith(title: "填写应收账款明细", textColor: kTextBlackColor, bgColor: nil, textFont: 15, textAlignment: nil, isFitFont: true)
        titleLB.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 0, width: 200, height: 20)
        headerView.addSubview(titleLB)
        
        let addBtn = Tool.createImgBtnWith(imageName: "mine_new_borrow_add", frame: ShiPei.CGRectMakeScaleWith(x: 335, y: 0, width: 20, height: 20), imageScale: 1, addWidth: 5)
        addBtn.addTarget(self, action: #selector(addReceivableView), for: UIControlEvents.touchUpInside)
        headerView.addSubview(addBtn)
        
        receivableTableView = BaseTableView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 1000), style: UITableViewStyle.plain)
        receivableTableView.isScrollEnabled = false
        receivableTableView.delegate = self
        receivableTableView.dataSource = self
        receivableTableView.tableHeaderView = headerView
        mainBgView2.addSubview(receivableTableView)

        
        let footView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 375, height: 90))
        footView.backgroundColor = kBgColor
        receivableTableView.tableFooterView = footView
        
//        let previewBtn = Tool.createButtonWith(title: "预览《保理业务申请书》", textColor: kGoldColor, bgColor: nil, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(previewApplyInstructionsClick))
//
//        footView.addSubview(previewBtn)
        
        let itemWidth: CGFloat = (375-40-20)/3
    
        let lastStepBtn = Tool.createButtonWith(title: "上一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(bottomBtnClickWith(_:)))
        lastStepBtn.info = "last"
        lastStepBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 20, width: itemWidth, height: 50)
        footView.addSubview(lastStepBtn)
        
        let saveBtn = Tool.createButtonWith(title: "保存", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(bottomBtnClickWith(_:)))
        saveBtn.info = "save"
        saveBtn.frame = ShiPei.CGRectMakeScaleWith(x: 30+itemWidth, y: 20, width: itemWidth, height: 50)
        footView.addSubview(saveBtn)
        
        let nextStepBtn = Tool.createButtonWith(title: "下一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 15, isFitFont: true, cornRadius: 5, target: self, action: #selector(bottomBtnClickWith(_:)))
        nextStepBtn.info = "next"
        nextStepBtn.frame = ShiPei.CGRectMakeScaleWith(x: 20+10*2+itemWidth*2, y: 20, width: itemWidth, height: 50)
        footView.addSubview(nextStepBtn)
        
    }
    func updateUI() {
        
        
    }
    
    
    @objc func addReceivableView(_ sender: UIButton) {
        
        
        let info = ReceivableInfo()
        receivableDetailArray?.append(info)
        receivableTableView.reloadData()
    }
    
    
    @objc func bottomBtnClickWith(_ sender: UIButton) {
        
        switch sender.info as! String {
        case "last":
            
            mainBgView1.isHidden = false
            mainBgView2.isHidden = true
            break
        case "save":

            break
        case "next":
            
            mainBgView1.isHidden = true
            mainBgView2.isHidden = false
            
            break
            
        default:
            
            break
        }
        
    }
    
    @objc func previewApplyInstructionsClick() {
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return receivableDetailArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        var receivableDetailCell = tableView .dequeueReusableCell(withIdentifier: cellId) as?ReceivableDetailCell
        
        if (receivableDetailCell == nil) {
            
            receivableDetailCell = ReceivableDetailCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            receivableDetailCell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        
        receivableDetailCell?.fetchDataWith(&receivableDetailArray![indexPath.row], index: indexPath.row)
        
        receivableDetailCell?.deleteBlock = {
            
            self.receivableDetailArray?.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return receivableDetailCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if (indexPath.row == 0){
            return 200*kScreenScale
        }else {
            return 240*kScreenScale
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
