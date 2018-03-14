//
//  CompanyMaterialViewController.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/2/28.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

internal enum PhotoType {
    
    case YYZZ
    case IdFront
    case IdBehind
    case Bank
    case NO
}

class CompanyMaterialViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var mainScrollView: BaseScrollView!
    var materialSArray: Array<Data?>!
    var photoType = PhotoType.NO
    var index = 0
    var dataArray: Array<String>?
    let yyzzView = UIView()
    let idFrontView = UIView()
    let idBehindView = UIView()
    let bankView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "企业基本资料"
        initUI();
    }

    func initUI() {
        
        mainScrollView = BaseScrollView(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height-KNavigateBarHeight))
        mainScrollView.backgroundColor = kWhiteColor
        mainScrollView.contentSize = ShiPei.CGSizeMakeScaleWith(width: 0, height: 800)
        view.addSubview(mainScrollView)
        
        let titleLB = Tool.createLabelWith(title: "企业基本资料包括：《营业执照（正本）》、公司法人的身份证（正/反面）和《银行卡户许可证》。请在一下指定位置完成材料的上传，并在完成后点击“提交审核”按钮。", textColor: kTextBlackColor, bgColor: nil, textFont: 15, textAlignment: NSTextAlignment.left, isFitFont: true)
        titleLB.numberOfLines = 0;
        titleLB.attributedText = Tool.attributeParagraphWith(5, titleLB.text!)
        mainScrollView.addSubview(titleLB);
        titleLB.snp.makeConstraints { (make) in
            make.top.equalTo(20*kScreenScale)
            make.left.equalTo(20*kScreenScale)
            make.width.equalTo(335*kScreenScale)
            make.height.equalTo(100*kScreenScale)
        }
        
        //营业执照
        mainScrollView.addSubview(yyzzView)
        yyzzView.snp.makeConstraints { (make) in

            make.top.equalTo(titleLB.snp.bottom).offset(20*kScreenScale)
            make.left.equalTo(20*kScreenScale)
            make.width.equalTo(160*kScreenScale)
            make.height.equalTo(250*kScreenScale)
        }

        let yyzzBtn = Tool.createButtonWith(title: "点击上传《营业执照》", textColor: kTextBlackColor, bgColor: kFuncColor(r: 216, g: 178, b: 105, alpha: 1), textFont: 14, isFitFont: true, cornRadius: 0, target: self, action: #selector(handPhotoWayClick(_ :)))
        yyzzBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 160, height: 200)
        yyzzBtn.titleLabel?.numberOfLines = 0
        yyzzBtn.tag = 10
        yyzzView.addSubview(yyzzBtn)

        let yyzzImgBtn = Tool.createButtonWith(title: "查看大图", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(viewImgClick(_:)))
        yyzzImgBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 210, width: 75, height: 35)
        yyzzImgBtn.info = PhotoType.YYZZ
        yyzzView.addSubview(yyzzImgBtn)

        let yyzzDeleteBtn = Tool.createButtonWith(title: "删除", textColor: kGoldColor, bgColor: kWhiteColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(deleteClick(_:)))
        yyzzDeleteBtn.frame = ShiPei.CGRectMakeScaleWith(x: 85, y: 210, width: 75, height: 35)
        yyzzDeleteBtn.showBorder(color: kGoldColor)
        yyzzDeleteBtn.info = PhotoType.YYZZ
        yyzzView.addSubview(yyzzDeleteBtn)
        
        
        //身份证正面
        mainScrollView.addSubview(idFrontView)
        idFrontView.snp.makeConstraints { (make) in
            
            make.top.equalTo(titleLB.snp.bottom).offset(20*kScreenScale)
            make.left.equalTo(yyzzView.snp.right).offset(15*kScreenScale)
            make.width.equalTo(160*kScreenScale)
            make.height.equalTo(250*kScreenScale)
        }
        
        let idFrontBtn = Tool.createButtonWith(title: "点击上传公司法人的身份证（正面）", textColor: kTextBlackColor, bgColor: kFuncColor(r: 216, g: 178, b: 105, alpha: 1), textFont: 14, isFitFont: true, cornRadius: 0, target: self, action: #selector(handPhotoWayClick(_ :)))
        idFrontBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 160, height: 200)
        idFrontBtn.titleLabel?.numberOfLines = 0
        idFrontBtn.tag = 11
        idFrontView.addSubview(idFrontBtn)
        
        let idFrontImgBtn = Tool.createButtonWith(title: "查看大图", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(viewImgClick(_:)))
        idFrontImgBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 210, width: 75, height: 35)
        idFrontImgBtn.info = PhotoType.IdFront
        idFrontView.addSubview(idFrontImgBtn)
        
        let idFrontDeleteBtn = Tool.createButtonWith(title: "删除", textColor: kGoldColor, bgColor: kWhiteColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(deleteClick(_:)))
        idFrontDeleteBtn.frame = ShiPei.CGRectMakeScaleWith(x: 85, y: 210, width: 75, height: 35)
        idFrontDeleteBtn.showBorder(color: kGoldColor)
        idFrontDeleteBtn.info = PhotoType.IdFront
        idFrontView.addSubview(idFrontDeleteBtn)
        
        //身份证反面
        mainScrollView.addSubview(idBehindView)
        idBehindView.snp.makeConstraints { (make) in
            
            make.top.equalTo(yyzzView.snp.bottom).offset(20*kScreenScale)
            make.left.equalTo(20*kScreenScale)
            make.width.equalTo(160*kScreenScale)
            make.height.equalTo(250*kScreenScale)
        }
        
        let idBehindBtn = Tool.createButtonWith(title: "点击上传公司法人的身份证（反面）", textColor: kTextBlackColor, bgColor: kFuncColor(r: 216, g: 178, b: 105, alpha: 1), textFont: 14, isFitFont: true, cornRadius: 0, target: self, action: #selector(handPhotoWayClick(_ :)))
        idBehindBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 160, height: 200)
        idBehindBtn.titleLabel?.numberOfLines = 0
        idBehindBtn.tag = 12
        idBehindView.addSubview(idBehindBtn)
        
        let idBehindImgBtn = Tool.createButtonWith(title: "查看大图", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(viewImgClick(_:)))
        idBehindImgBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 210, width: 75, height: 35)
        idBehindImgBtn.info = PhotoType.IdBehind
        idBehindView.addSubview(idBehindImgBtn)
        
        let idBehindDeleteBtn = Tool.createButtonWith(title: "删除", textColor: kGoldColor, bgColor: kWhiteColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(deleteClick(_:)))
        idBehindDeleteBtn.frame = ShiPei.CGRectMakeScaleWith(x: 85, y: 210, width: 75, height: 35)
        idBehindDeleteBtn.info = PhotoType.IdBehind
        idBehindDeleteBtn.showBorder(color: kGoldColor)
        idBehindView.addSubview(idBehindDeleteBtn)
        
        //银行许可证
        mainScrollView.addSubview(bankView)
        bankView.snp.makeConstraints { (make) in

            make.top.equalTo(idFrontView.snp.bottom).offset(20*kScreenScale)
            make.left.equalTo(idBehindView.snp.right).offset(15*kScreenScale)
            make.width.equalTo(160*kScreenScale)
            make.height.equalTo(250*kScreenScale)
        }

        let bankBtn = Tool.createButtonWith(title: "点击上传公司的银行开户许可证", textColor: kTextBlackColor, bgColor: kFuncColor(r: 216, g: 178, b: 105, alpha: 1), textFont: 14, isFitFont: true, cornRadius: 0, target: self, action: #selector(handPhotoWayClick(_ :)))
        bankBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: 160, height: 200)
        bankBtn.titleLabel?.numberOfLines = 0
        bankBtn.tag = 13
        bankView.addSubview(bankBtn)

        let bankImgBtn = Tool.createButtonWith(title: "查看大图", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(viewImgClick(_:)))
        bankImgBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 210, width: 75, height: 35)
        bankImgBtn.info = PhotoType.Bank
        bankView.addSubview(bankImgBtn)

        let bankDeleteBtn = Tool.createButtonWith(title: "删除", textColor: kGoldColor, bgColor: kWhiteColor, textFont: 14, isFitFont: true, cornRadius: 3, target: self, action: #selector(deleteClick(_:)))
        bankDeleteBtn.frame = ShiPei.CGRectMakeScaleWith(x: 85, y: 210, width: 75, height: 35)
        bankDeleteBtn.showBorder(color: kGoldColor)
        bankDeleteBtn.info = PhotoType.Bank
        bankView.addSubview(bankDeleteBtn)
        
        //上一步
        let lastStepBtn = Tool.createButtonWith(title: "上一步", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(lastStepClick))
        mainScrollView.addSubview(lastStepBtn)
        lastStepBtn.snp.makeConstraints { (make) in
            
            make.top.equalTo(idBehindView.snp.bottom).offset(40*kScreenScale)
            make.left.equalTo(15*kScreenScale)
            make.width.equalTo(167*kScreenScale)
            make.height.equalTo(45*kScreenScale)
        }
        
        //提交审核
        let handBtn = Tool.createButtonWith(title: "提交审核", textColor: kWhiteColor, bgColor: kGoldColor, textFont: 16, isFitFont: true, cornRadius: 5, target: self, action: #selector(lastStepClick))
        mainScrollView.addSubview(handBtn)
        handBtn.snp.makeConstraints { (make) in
            
            make.top.equalTo(bankView.snp.bottom).offset(40*kScreenScale)
            make.left.equalTo(lastStepBtn.snp.right).offset(10*kScreenScale)
            make.width.equalTo(167*kScreenScale)
            make.height.equalTo(45*kScreenScale)
        }
        
    }
    
    func updateUI() {
        
    }
    
    @objc func handMaterialClick(_ sender: UIButton) {
        
        
        
    }
    
    
    /// 查看大图
    ///
    /// - Parameter sender: <#sender description#>
    @objc func viewImgClick(_ sender: UIButton) {
        
        let image: UIImage?
        
        switch sender.info as! PhotoType {
            
        case PhotoType.YYZZ:
            
            let btn = yyzzView.viewWithTag(10) as! UIButton
            image = btn.imageView?.image
            break
            
        case PhotoType.IdFront:
            
            let btn = idFrontView.viewWithTag(11) as! UIButton
            image = btn.imageView?.image
            break
            
        case PhotoType.IdBehind:
            
            let btn = idBehindView.viewWithTag(12) as! UIButton
            image = btn.imageView?.image
            break
            
        case PhotoType.Bank:
            
            let btn = bankView.viewWithTag(13) as! UIButton
            image = btn.imageView?.image
            break
            
        default:
            image = nil
            break
        }
        
        if image != nil {
            
            let bgView = UIView(frame: ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: kScreen_width, height: kScreen_Height))
            
            let imgView = UIImageView(image: image)
            imgView.frame = ShiPei.CGRectMakeScaleWith(x: 20, y: 150, width: 335, height: 400)
            bgView.addSubview(imgView)
            
            let closeBtn = Tool.createImgBtnWith(imageName:"mine_company_general_close", frame: ShiPei.CGRectMakeScaleWith(x: 172, y: 600, width: 30, height: 30), imageScale: 1, addWidth: 5)
            closeBtn.addTarget(self, action: #selector(cancelViewImgClick), for: UIControlEvents.touchUpInside)
            bgView.addSubview(closeBtn)
            
            AlertBgView.sharedWith(bgView)?.show()
        }
        
    }
    
    @objc func cancelViewImgClick() {
        
        AlertBgView.sharedWith(nil)?.dismiss()
    }
    
    
    /// 删除
    ///
    /// - Parameter sender: <#sender description#>
    @objc func deleteClick(_ sender: UIButton) {
        
        switch sender.info as! PhotoType {
            
        case PhotoType.YYZZ:
            
            let btn = yyzzView.viewWithTag(10) as! UIButton
            btn.setImage(nil, for: UIControlState.normal)
            break
            
        case PhotoType.IdFront:
            
            let btn = idFrontView.viewWithTag(11) as! UIButton
            btn.setImage(nil, for: UIControlState.normal)
            break
            
        case PhotoType.IdBehind:
            
            let btn = idBehindView.viewWithTag(12) as! UIButton
            btn.setImage(nil, for: UIControlState.normal)
            break
            
        case PhotoType.Bank:
            
            let btn = bankView.viewWithTag(13) as! UIButton
            btn.setImage(nil, for: UIControlState.normal)
            break
            
        default:
            break
        }
        
    }

    
    @objc func handPhotoWayClick(_ sender: UIButton) {
        
        index = sender.tag
        
        PhotoWayView.sharedPhotoWayViewWith {  [unowned self] (photoType) in
            
            switch photoType {
                
                case WayType.album:
                
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        
                        let picker = UIImagePickerController()
                        picker.delegate = self
                        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                        self.present(picker, animated: true, completion: nil)
                        
                    }else{
                        self.createTipAlertViewWith("读取相册错误")
                    }
                    
                    break
                
                case WayType.camera:
                    
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        
                        let picker = UIImagePickerController()
                        picker.delegate = self;
                        picker.sourceType = UIImagePickerControllerSourceType.camera
                        self.present(picker, animated: true, completion: nil)
                    }else{
                        self.createTipAlertViewWith("请在设置中打开相机权限")
                    }
                    
                
                    break
                
                case WayType.file:
                    
                    
                    
                
                    break
            }
            
        }.show()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imageURL = info[UIImagePickerControllerReferenceURL] as! NSURL
        let imageName = imageURL.path!
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let data = UIImagePNGRepresentation(image)
        let dataStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String

        
       
        
        switch index {
            
        case 10:
            
            let btn = yyzzView.viewWithTag(10) as! UIButton
            btn.setImage(image, for: UIControlState.normal)
//            dataArray?.insert(dataStr, at: 0)
            break
            
        case 11:
            
            let btn = idFrontView.viewWithTag(11) as! UIButton
            btn.setImage(image, for: UIControlState.normal)
//            dataArray?.insert(dataStr, at: 1)
            break
            
        case 12:
            
            let btn = idBehindView.viewWithTag(12) as! UIButton
            btn.setImage(image, for: UIControlState.normal)
//            dataArray?.insert(dataStr, at: 2)
            break
            
        case 13:
            
            let btn = bankView.viewWithTag(13) as! UIButton
            btn.setImage(image, for: UIControlState.normal)
//            dataArray?.insert(dataStr, at: 3)
            break
            
        default:
            break
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func lastStepClick() {
        navigationController?.popViewController(animated: true)
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
