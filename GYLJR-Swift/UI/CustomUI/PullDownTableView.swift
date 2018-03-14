//
//  PullDownTableView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/8.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class PullDownTableView:UIView, UITableViewDelegate, UITableViewDataSource {

    typealias CellClickBlock = (Int) -> Void

    var dataArray: Array<String>!
    var cellHeight: CGFloat!
    var delegate: Any?
    var cellClickBlock: CellClickBlock!
    var headerViewHeight: CGFloat!
    var contentHeight: CGFloat!
    var currentIndex: Int = 0 {
        didSet {
            reloadData()
        }
    }
    private var pullDownTableView: UITableView!
    private var contentBtn: UIButton!
    
    //MARK: 初始化方法
    init(frame: CGRect, dataArray: Array<String>, delegate: Any, leftViewWidth: CGFloat, cellHeight: CGFloat, cellClickBlock: @escaping CellClickBlock) {
        
        super.init(frame: frame)
        
        self.dataArray = dataArray
        self.delegate = delegate
        self.headerViewHeight = frame.size.height
        self.cellClickBlock = cellClickBlock
        self.cellHeight = cellHeight
        self.contentHeight = CGFloat(dataArray.count) * cellHeight * kScreenScale
        if (CGFloat(dataArray.count) * cellHeight > 150) {
            contentHeight = 5*cellHeight
        }
        showBorder(color: kFuncColor(r: 190, g: 190, b: 190, alpha: 1))
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftViewWidth, height: headerViewHeight))
        leftView.backgroundColor = kWhiteColor
        addSubview(leftView)
        
        contentBtn = Tool.createButtonWith(title: dataArray[0], textColor: kTextColor, bgColor: kWhiteColor, textFont: 14, isFitFont: true, cornRadius: 0, target: self, action: #selector(showTypeViewClick(_:)))
        contentBtn.frame = CGRect(x: leftViewWidth, y: 0, width: frame.size.width-leftViewWidth, height: headerViewHeight)
        contentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        addSubview(contentBtn)

        let arrowIV = UIImageView(image: UIImage(named: "mine_rightArrow"))
        contentBtn.addSubview(arrowIV)
        arrowIV.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(contentBtn.snp.right).offset(-15*kScreenScale)
            make.width.equalTo(20*kScreenScale)
            make.height.equalTo(20*kScreenScale)
        }
        
        initTableViewWith(frame: frame, style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initTableViewWith(frame: CGRect, style: UITableViewStyle) {
        
        pullDownTableView = UITableView(frame: CGRect(x: 0 ,y: 0 ,width: 0 ,height:0), style: style)
        pullDownTableView.delegate = self
        pullDownTableView.dataSource = self
        pullDownTableView.clipsToBounds = true
        pullDownTableView.showBorder(color: kLineColor)
//        pullDownTableView.showsVerticalScrollIndicator = false
        pullDownTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        pullDownTableView.bounces = false
        pullDownTableView.isHidden = true
        addSubview(pullDownTableView)
        pullDownTableView.snp.makeConstraints { (make) in
            make.top.equalTo(contentBtn.snp.bottom).offset(0)
            make.left.equalTo(self.snp.left)
            make.width.equalTo(frame.size.width)
            make.height.equalTo(contentHeight)
        }
        
        if(delegate is UIView){
            (delegate as! UIView).addSubview(self)
        }else if (delegate is UIViewController) {
            (delegate as! UIViewController).view.addSubview(self)
        }
    }
    
    //MARK:tableView的delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil){
            
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            let bgView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: cellHeight))
            cell?.contentView.addSubview(bgView)
            
            let titleLabel = Tool.createLabelWith(title: "", textColor: kTextBlackColor, bgColor: nil, textFont: 13, textAlignment: nil, isFitFont: true)
            titleLabel.frame = CGRect(x: 30*kScreenScale, y: 0, width: frame.size.width, height: cellHeight)
            titleLabel.tag = 9
            cell?.contentView.addSubview(titleLabel)
            
            let selectIconIV = UIImageView(image: UIImage(named: "mine_new_borrow_duihao"))
            selectIconIV.tag = 10
            selectIconIV.isHidden = true
            selectIconIV.frame = ShiPei.CGRectMakeScaleWith(x: 5, y: 0, width: 20, height: 20)
            cell?.contentView.addSubview(selectIconIV)
        }
        let titleLabel = cell?.contentView.viewWithTag(9) as! UILabel
        titleLabel.text = dataArray[indexPath.row]
        
        let selectIconIV = cell?.contentView.viewWithTag(10)
        selectIconIV?.isHidden = true
        if currentIndex == indexPath.row {
            selectIconIV?.isHidden = false
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        pullDownTableView.isHidden = true
        pullDownTableView.setHeight(0)
        setHeight(headerViewHeight)
        CLog(currentIndex,indexPath.row)

        if currentIndex == indexPath.row {
            return
        }
        currentIndex = indexPath.row
        cellClickBlock(currentIndex)
        contentBtn.setTitle(dataArray[currentIndex], for: UIControlState.normal)
        reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func reloadData () {
        
        pullDownTableView.reloadData()
    }
    
    //MARK: IBActions
    @objc func showTypeViewClick(_ sender: UIButton)  {
        
        setHeight(contentHeight+headerViewHeight)
        pullDownTableView.setHeight(contentHeight)
        
        if(delegate is UIView){
            (delegate as! UIView).bringSubview(toFront: self)
        }else if (delegate is UIViewController) {
            (delegate as! UIViewController).view.bringSubview(toFront: self)
        }
        pullDownTableView.isHidden = false
    }
    
    
    
}
