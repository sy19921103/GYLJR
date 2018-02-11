//
//  SYTabBar.swift
//  CustomTabbar
//
//  Created by shenyi on 2018/2/7.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

protocol TabBarItemDelegate {
    func tabBarItemClickWith(index: Int)
}

class SYTabBar: UIImageView {
    
    var titleArray: Array<String>!
    var selectTitleColor: UIColor!
    var unselectTitleColor: UIColor!
    var selectIconArray: Array<String>!
    var unselectIconArray: Array<String>!
    var delegate: TabBarItemDelegate!
    var selectIndex: Int = 0 {
        willSet{
            let lastTabBarItem = viewWithTag(selectIndex+10) as! SYTabBarItem
            lastTabBarItem.isSelected = false
            
            let currentTabBarItem = viewWithTag(newValue+10) as! SYTabBarItem
            currentTabBarItem.isSelected = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func customUI() {
        
        image = UIImage(named: "tabBarBgImg")
        for i in 0..<titleArray.count {
            
            let itemView = SYTabBarItem(frame: CGRect(x: kScreen_width/CGFloat(titleArray.count)*CGFloat(i), y: 0, width: kScreen_width/CGFloat(titleArray.count), height: 48) , element: TabBarItemElement(title: titleArray[i], unselectTitleColor: unselectTitleColor, selectTitleColor: selectTitleColor, selectIconImage: selectIconArray[i], unselectIconImage: unselectIconArray[i]))
            itemView.isSelected = false
            itemView.tag = i+10
            if i == 0 {
                itemView.isSelected = true
            }
            itemView.addTarget(self, action:#selector(itemClick(sender:)) , for: UIControlEvents.touchUpInside)
            addSubview(itemView)
        }
    }
    
    @objc func itemClick(sender: UIButton) {
        
        selectIndex = sender.tag-10
        delegate.tabBarItemClickWith(index: sender.tag-10)
    }
}
