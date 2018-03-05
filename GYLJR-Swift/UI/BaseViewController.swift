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
        rootController?.setStatusBarStyle(statusBarStyle: statusBarStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false;
        view.backgroundColor = kBgColor
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
    
    func createTipAlertViewWith(_ message: String) {
        
        let tipLabel = Tool.createLabelWith(title: message, textColor: kWhiteColor, bgColor: kFuncColor(r: 140, g: 140, b: 140, alpha: 1), textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        let window = UIApplication.shared.keyWindow
        window?.addSubview(tipLabel)
        
        let size = message.boundingRect(with: ShiPei.CGSizeMakeScaleWith(width: 345, height: 50), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:tipLabel.font], context: nil).size
        
        tipLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40*kScreenScale)
            make.width.equalTo((size.width+20)*kScreenScale)
            make.height.equalTo((size.height+20)*kScreenScale)
        }
        tipLabel.layer.masksToBounds = true
        tipLabel.layer.cornerRadius = (size.height+20)/2*kScreenScale
    
        UIView.animate(withDuration: 4, animations: {
            
            tipLabel.alpha = 0.5
            
        }) { (completion) in
            
            tipLabel.alpha = 0
            tipLabel.removeFromSuperview()
        }
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
