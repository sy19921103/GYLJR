//
//  RootTabBarController.swift
//  CustomTabbar
//
//  Created by shenyi on 2018/2/9.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

class RootTabBarController: SYTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeTabBar()
        setUpViewControllers()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        get { return.lightContent}
        
    }
    func customizeTabBar() {
        
        titleArray = ["首页", "我的"]
        selectIconArray = ["main_icon_select","mine_icon_select"]
        unselectIconArray = ["main_icon_unselect","mine_icon_unselect"]
        setTabBarView()
    }
    
    func setUpViewControllers()  {
        
        let mainVC = MainViewController()
        let mainNav = UINavigationController(rootViewController: mainVC)
        
        let mineVC = MineViewController()
        let mineNav = UINavigationController(rootViewController: mineVC)
        viewControllers = [mainNav, mineNav]
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
