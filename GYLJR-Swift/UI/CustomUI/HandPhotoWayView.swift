//
//  HandPhotoWayView.swift
//  GYLJR-Swift
//
//  Created by iOS on 2018/3/1.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

enum WayType {
    
    case album
    case camera
    case file
}

class PhotoWayView: UIView {
    
    typealias PhotoWayBlock = (WayType) -> Void
    
    var photoWayBlock: PhotoWayBlock!
    
    var contentView: UIView!
    
    static var photoWayView :PhotoWayView?
    
    static func sharedPhotoWayViewWith(_ photoWayBlock: @escaping PhotoWayBlock) -> PhotoWayView {
        
        if photoWayView == nil {
            photoWayView = PhotoWayView.init(frame: CGRect(x: 0, y: 0, width: kScreen_width, height: kScreen_Height), photoWayBlock: photoWayBlock)
        }
        
        return photoWayView!
    }
    
    private init(frame: CGRect, photoWayBlock: @escaping PhotoWayBlock) {
        
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        self.addGestureRecognizer(tapGesture)
        self.backgroundColor = UIColor.black
        self.alpha = 0.4
        self.contentView = initContentView()
        self.photoWayBlock = photoWayBlock
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    func initContentView() -> UIView {
        
        let contentView = UIView()
        contentView.backgroundColor = kFuncColor(r: 230, g: 230, b: 230, alpha: 1)

        let itemWidth = CGFloat(375/7)
        
        //相册
        let albumBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: itemWidth, y: 30, width: itemWidth, height: 85))
        albumBtn.info = WayType.album
        albumBtn.addTarget(self, action: #selector(itemClick(_:)), for: UIControlEvents.touchUpInside)
        contentView.addSubview(albumBtn)
        
        let albumIV = UIImageView.init(image: UIImage(named: "mine_album"))
        albumIV.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: itemWidth, height: itemWidth)
        albumBtn.addSubview(albumIV)
        
        let albumTitleLB = Tool.createLabelWith(title: "相册", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        albumTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 70, width: itemWidth, height: 15)
        albumBtn.addSubview(albumTitleLB)
        
        
        //拍照
        let cameraBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: itemWidth*3, y: 30, width: itemWidth, height: 85))
        cameraBtn.info = WayType.camera
        cameraBtn.addTarget(self, action: #selector(itemClick(_:)), for: UIControlEvents.touchUpInside)
        contentView.addSubview(cameraBtn)
        
        let cameraIV = UIImageView.init(image: UIImage(named: "mine_camera"))
        cameraIV.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: itemWidth, height: itemWidth)
        cameraBtn.addSubview(cameraIV)
        
        let cameraTitleLB = Tool.createLabelWith(title: "拍照", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        cameraTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 70, width: itemWidth, height: 15)
        cameraBtn.addSubview(cameraTitleLB)
        
        
        //文件
        let fileBtn = UIButton(frame: ShiPei.CGRectMakeScaleWith(x: itemWidth*5, y: 30, width: itemWidth, height: 85))
        fileBtn.info = WayType.file
        fileBtn.addTarget(self, action: #selector(itemClick(_:)), for: UIControlEvents.touchUpInside)
        contentView.addSubview(fileBtn)
        
        let fileIV = UIImageView.init(image: UIImage(named: "mine_file"))
        fileIV.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 0, width: itemWidth, height: itemWidth)
        fileBtn.addSubview(fileIV)
        
        let fileTitleLB = Tool.createLabelWith(title: "文件", textColor: kTextBlackColor, bgColor: nil, textFont: 14, textAlignment: NSTextAlignment.center, isFitFont: true)
        fileTitleLB.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 70, width: itemWidth, height: 15)
        fileBtn.addSubview(fileTitleLB)
        
        let cancelBtn = Tool.createButtonWith(title: "取消", textColor: kTextBlackColor, bgColor: kWhiteColor, textFont: 16, isFitFont: true, cornRadius: 0, target: self, action: #selector(dismiss))
        cancelBtn.frame = ShiPei.CGRectMakeScaleWith(x: 0, y: 140, width: 375, height: 40)
        cancelBtn.addTarget(self, action: #selector(dismiss), for: UIControlEvents.touchUpInside)
        contentView.addSubview(cancelBtn)
        
        return contentView
    }
    
    
    //MARK: Public
    func show() {
        
        UIApplication.shared.keyWindow?.addSubview(self)
        UIApplication.shared.keyWindow?.addSubview(self.contentView)
        contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(kScreen_width)
            make.height.equalTo(180*kScreenScale)
        }
    }
    
    
    //MARK: IBAction
    @objc func itemClick(_ sender: UIButton) {
        
        dismiss()
        
        photoWayBlock(sender.info as! WayType)
        
    }
    
    @objc func dismiss() {
        
        self.removeFromSuperview()
        self.contentView.removeFromSuperview()
    }

    
}
