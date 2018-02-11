//
//  BaseViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        get { return.lightContent}
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        setStatusBarStyle(statusBarStyle: UIStatusBarStyle.default)
        isHiddenTabBarWith(isHidden: true, isAnimated: false)
        navigationController?.setNavigationBarHidden(false, animated: false)
        addLeftButtonWith(imageName: "nav_back", tapSel: #selector(backToLast))

    }
    
    func setStatusBarStyle(statusBarStyle: UIStatusBarStyle) {
        let rootController = getMainRootViewController()
        print(statusBarStyle.rawValue)
        rootController?.setStatusBarStyle(statusBarStyle: statusBarStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = kWhiteColor
        addLeftButtonWith(imageName: "", tapSel: #selector(backToLast))
        setNavigationBar()
    }
    
    
    
    func setNavigationBar()  {
        
        if(kIsIphoneX){
            navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navBarBgImg"), for: UIBarMetrics.default)
        }else{
            navigationController?.navigationBar.setBackgroundImage(UIImage(named: "123"), for: UIBarMetrics.default)
        }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:kTextBlackColor,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize:18)]
        edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
    }
    
    func addLeftButtonWith(imageName: String, tapSel: Selector) {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        
        let leftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftBtn.addTarget(self, action: tapSel, for: UIControlEvents.touchUpInside)
        leftBtn.addSubview(imageView)
        
        let leftBarItem = UIBarButtonItem(customView: (leftBtn as UIView))
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
    
    func isHiddenTabBarWith(isHidden: Bool, isAnimated: Bool) {
        
        let rootController = getMainRootViewController()
        rootController?.setTabBarIsHidden(isHidden: isHidden, isAnimated: isAnimated)
    }
    
    func getMainRootViewController() -> SYTabBarController! {
        let rootController = UIApplication.shared.keyWindow?.rootViewController as! SYTabBarController
        return rootController
    }
    
    func jumpToRootViewBy(index: Int) {
        
        let rootController = getMainRootViewController()
        rootController?.selectIndex = index
    }
    
    @objc func backToLast() {
        navigationController?.popViewController(animated: true)
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
