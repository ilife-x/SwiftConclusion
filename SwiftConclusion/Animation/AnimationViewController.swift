//
//  AnimationViewController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/23.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        let ctView = CustomView()
        ctView.frame = CGRect(x: 0, y: 0, width: kScreenHeight, height: 300)
        view.addSubview(ctView)
        
    }


}
