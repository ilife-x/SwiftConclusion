//
//  AnimationViewController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/23.
//

import UIKit

class AnimationViewController: UIViewController {
    
    lazy var scrollView:UIScrollView = {
        let scView = UIScrollView(frame: UIScreen.main.bounds)
        scView.contentSize = CGSize(width: kScreenWidth, height: kScreenHeight * 2)
        return scView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        setupUI()
    }
    
    func setupUI() {
        
        let rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(clickRightItem))
        self.navigationItem.rightBarButtonItem = rightItem
        
        view.addSubview(scrollView)
        let ctView = CustomView()
        ctView.frame = CGRect(x: 0, y: 0, width: kScreenHeight, height: 300)
        scrollView.addSubview(ctView)
        
        let scView = SliderCircleView()
        scView.frame = CGRect(x: 0, y: 300, width: kScreenHeight, height: 300)
        scrollView.addSubview(scView)
        
        let cpView = CircleProgressView()
        cpView.frame = CGRect(x: 0, y: 600, width: kScreenHeight, height: 300)
        scrollView.addSubview(cpView)
        //定时器开启,会开始绘制进度
//        cpView.timer.fire()
        
        //用已有图片生成 color
        let imgView = UIImageView(frame: CGRect(x: 0, y: 900, width: kScreenWidth, height: 300))
        let img = UIImage(named: "tabbar_setting_nomal")
        imgView.backgroundColor = UIColor.init(patternImage: img!)
        scrollView.addSubview(imgView)
        
        //用生成好的view当背景
        let pView = PattenView(frame: CGRect(x: 0, y: 1200, width: kScreenWidth, height: 300))
        scrollView.addSubview(pView)
        
        let bView = BackgroundView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 300))
        let bimg = coverViewToImage(bView)
        let bv = UIImageView(frame: CGRect(x: 0, y: 1500, width: kScreenWidth, height: 300))
        bv.image = bimg
        scrollView.addSubview(bv)
        
        
        
        
    }
    
   @objc func clickRightItem() {
        print("-----")
    
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, false, UIScreen.main.scale)
    scrollView.layer.render(in: UIGraphicsGetCurrentContext()!)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    //save,写入相册
    UIImageWriteToSavedPhotosAlbum(img!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    UIGraphicsEndImageContext()
    
   }
    
    @objc func image(_ image:UIImage, didFinishSavingWithError error:Error, contextInfo info:String)  {
        debugPrint("保存")
    }
    

    
    //view->image
    func coverViewToImage(_ view:UIView) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        
        //view 转 image 的核心代码
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img =  UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return img!
    }


}
