//
//  MineViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/9.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    
    func checkLoginInfo() {
        if(ApiManager.shared.loginInfo == nil){
         
            let loginVC = LoginViewController()
            navigationController?.pushViewController(loginVC, animated: false)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.isHiddenTabBarWith(isHidden: false, isAnimated: false)

        self.navigationItem.hidesBackButton = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "我的"
        checkLoginInfo()
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
