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
        
        setValue(Tabbar(), forKeyPath: "tabBar")
        tabBar.barTintColor = .white


        addChild("Home", "tabbar_home_nomal", "tabbar_home_hilight", HomeViewController.self)
        addChild("Ani", "tabbar_animation_nomal", "tabbar_animation_hilight", AnimationViewController.self)
        addChild("Setting", "tabbar_third_normal", "tabbar_third_hilight", ThirdViewController.self)
        addChild("Third", "tabbar_setting_nomal", "tabbar_setting_hilight", SettingViewController.self)



    }
    
    func addChild(_ title:String, _ nomalImage:String ,_ selectImage:String ,_ type:UIViewController.Type){
        let vc = type.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: nomalImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.systemBlue], for: .selected)

        vc.view.backgroundColor = .white
        let navc = BaseNavigationController(rootViewController: vc)
        addChild(navc)
        
    }

}
