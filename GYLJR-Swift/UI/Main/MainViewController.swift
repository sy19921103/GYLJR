//
//  MainViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, WRCycleScrollViewDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true;
        isHiddenTabBarWith(isHidden: false, isAnimated: false)
//        setStatusBarStyle(statusBarStyle: UIStatusBarStyle.lightContent)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
        
        let bannerSV = BannerScrollView(frame: CGRect(x: 0, y: 0, width: 375, height: 100), placeHold:"")
        bannerSV.backgroundColor = kGoldColor
        view.addSubview(bannerSV)
        
    }
    
    @objc func click() {
        jumpToRootViewBy(index: 1)
    }

    /// 点击图片事件
    func cycleScrollViewDidSelect(at index:Int, cycleScrollView:WRCycleScrollView)
    {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动事件
    func cycleScrollViewDidScroll(to index:Int, cycleScrollView:WRCycleScrollView)
    {
        print("滚动到了第\(index+1)个图片")
    }

}

