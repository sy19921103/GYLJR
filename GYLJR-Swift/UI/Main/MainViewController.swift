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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        
        let cycleView = SQAutoScrollView(frame: CGRect.init(x: 0, y: 0, width: view.bounds.size.width, height: 300), urls: serverImages, didItemCallBack: { (view, index) in
            print("view--->\(view), index-->\(index)")
        })
        view.addSubview(cycleView)
        
    }
}

