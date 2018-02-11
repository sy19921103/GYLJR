//
//  BannerScrollView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/11.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class BannerScrollView: UIScrollView {

    var placeHold: NSString!
    var pageControl: UIPageControl!
    var currentIndex: Int = 0
    var leftImageView: UIImageView?
    var centerImageView: UIImageView?
    var rightImageView: UIImageView?
    
    init(frame: CGRect, placeHold: NSString) {
        super.init(frame: frame)
        self.placeHold = placeHold
        initUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        
    }
    

}
