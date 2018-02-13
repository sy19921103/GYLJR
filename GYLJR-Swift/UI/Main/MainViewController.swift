//
//  MainViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController
{
    var defaultBannerIV: UIImageView!
    var mainSV: BaseScrollView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        isHiddenTabBarWith(isHidden: false, isAnimated: false)
//        setStatusBarStyle(statusBarStyle: UIStatusBarStyle.lightContent)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        
//        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
//
//        let cycleView = SQAutoScrollView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 0, width: 375, height: 180), urls: serverImages, didItemCallBack: { (view, index) in
//            print("view--->\(view), index-->\(index)")
//        })
//        view.addSubview(cycleView)
        
        mainSV = BaseScrollView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height-kTabBarHeight))
        mainSV.contentSize = ShiPei.CGSizeMakeScaleWith(width: 375, height: 1646)
        view.addSubview(mainSV)
        
        defaultBannerIV = UIImageView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 0, width: 375, height: 180))
        defaultBannerIV.image = UIImage(named: "main-banner")
        mainSV.addSubview(defaultBannerIV)
        
        let contentIV = UIImageView(frame: ShiPei.CCRectMakeScaleWith(x: 0, y: 200, width: 375, height: 1426))
        contentIV.image = UIImage(named: "main-content")
        mainSV.addSubview(contentIV)
        
        let applyBtn = UIButton(frame: ShiPei.CCRectMakeScaleWith(x: 15, y: 580, width: 345, height: 50))
        applyBtn.addTarget(self, action: #selector(applyClick), for: UIControlEvents.touchUpInside)
        mainSV.addSubview(applyBtn)
        
    }
    
    @objc func applyClick() {
        CLog("apply")
    }
    
}

