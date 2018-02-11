//
//  SYTabBarItem.swift
//  CustomTabbar
//
//  Created by shenyi on 2018/2/7.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

struct TabBarItemElement {
    
    var title: String!
    var unselectTitleColor: UIColor!
    var selectTitleColor: UIColor!
    var selectIconImage: String!
    var unselectIconImage: String!
}

class SYTabBarItem: UIControl {

    private var titleLabel: UILabel!
    private var iconImageView: UIImageView!
    var element: TabBarItemElement!
    
    override var isSelected: Bool{
        
        didSet {
            if(isSelected){
                titleLabel.textColor = element.selectTitleColor
                iconImageView.image = UIImage.init(named: element.selectIconImage)
            }else{
                titleLabel.textColor = element.unselectTitleColor
                iconImageView.image = UIImage.init(named: element.unselectIconImage)
            }
        }
    }
    
    convenience init(frame: CGRect, element: TabBarItemElement) {
        self.init(frame: frame)
        
        self.element = element
        backgroundColor = UIColor.clear
        
        iconImageView = UIImageView.init(frame: CGRect(x: (frame.width-25)/2, y: 5, width: 25, height: 25))
        iconImageView.image = UIImage(named: element.unselectIconImage)
        addSubview(iconImageView)
        
        titleLabel = UILabel.init(frame: CGRect(x: 0, y: 33, width: frame.size.width, height: 15))
        titleLabel.textColor = element.unselectTitleColor
        titleLabel.text = element.title
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        addSubview(titleLabel)
    }
    
}
