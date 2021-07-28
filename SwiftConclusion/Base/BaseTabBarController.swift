//
//  BaseTabBarController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/7/28.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild("Home", "", "", HomeViewController.self)
        addChild("Third", "", "", ThirdViewController.self)
        addChild("Setting", "", "", SettingViewController.self)


    }
    
    func addChild(_ title:String, _ nomalImage:String ,_ selectImage:String ,_ type:UIViewController.Type){
        let vc = type.init()
        vc.title = title
        vc.view.backgroundColor = .white
        let navc = BaseNavigationController(rootViewController: vc)
        tabBar.barTintColor = .systemTeal
        addChild(navc)
        
    }

}
