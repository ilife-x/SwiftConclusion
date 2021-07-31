//
//  Tabbar.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/7/30.
//

import UIKit

class Tabbar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        for button in subviews where button is UIControl{
            print(button)
            var frame = button.frame
            frame.origin.y = -2
            button.frame = frame
            
        }
    }

}
