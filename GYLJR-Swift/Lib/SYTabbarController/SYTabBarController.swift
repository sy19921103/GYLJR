//
//  SYTabBarController.swift
//  CustomTabbar
//
//  Created by shenyi on 2018/2/7.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

class SYTabBarController: UIViewController, TabBarItemDelegate {
    
    var contentView: UIView!
    var titleArray: Array<String>!
    var selectIconArray: Array<String>!
    var unselectIconArray: Array<String>!
    var tabBar: SYTabBar!
    var statusBarStyle: UIStatusBarStyle!
    {
        didSet {
            print(statusBarStyle.rawValue)
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    var selectIndex :Int = 0
    {
        willSet{
            
            let lastVC = viewControllers[selectIndex]
            lastVC .willMove(toParentViewController: nil)
            lastVC.removeFromParentViewController()
            lastVC.view .removeFromSuperview()
            
            let currentVC = viewControllers[newValue]
            addChildViewController(currentVC)
            contentView.addSubview(currentVC.view)
            currentVC.view.frame = contentView.bounds
            currentVC .didMove(toParentViewController: self)
            
            tabBar.selectIndex = newValue
        }
    }
    
    var viewControllers: Array<UIViewController>!
    {
        didSet{
            let currentVC = viewControllers[selectIndex]
            addChildViewController(currentVC)
            contentView.addSubview(currentVC.view)
            currentVC.view.frame = contentView.bounds
            CLog(currentVC.view.frame)
            currentVC.didMove(toParentViewController: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setContentView()
    }
    
    
    func setStatusBarStyle(statusBarStyle :UIStatusBarStyle) {
        self.statusBarStyle = statusBarStyle
    }
    
    func setContentView() {
        contentView = UIView(frame: CGRect(x: 0, y: kStatusBarHeight, width: kScreen_width, height: kScreen_Height))
        view.addSubview(contentView)
    }
    
    func setTabBarView() {
        
        tabBar = SYTabBar(frame: CGRect(x: 0, y: kScreen_Height-kTabBarHeight, width: kScreen_width, height: kTabBarHeight))
        tabBar.titleArray = titleArray
        tabBar.selectTitleColor = UIColor.blue
        tabBar.unselectTitleColor = UIColor.black
        tabBar.selectIconArray = selectIconArray
        tabBar.unselectIconArray = unselectIconArray
        tabBar.customUI()
        tabBar.delegate = self
        view.addSubview(tabBar)
    }
    
    func tabBarItemClickWith(index: Int) {
        
        if(index == selectIndex)
        {
            return
        }
        selectIndex = index
    }
    
    func setTabBarIsHidden(isHidden: Bool, isAnimated: Bool)  {
        
        if(isAnimated){
            UIView.animate(withDuration: 0.25, animations: {
                self.tabBar.isHidden = isHidden
            })
        }else{
            tabBar.isHidden = isHidden
        }
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
