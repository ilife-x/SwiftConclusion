//
//  FontViewController.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/9/14.
//

import UIKit

class FontViewController: UIViewController {
    
    lazy var tipLabel:UILabel = {
        let label = UILabel()
        label.text = "字体展示"
        label.textAlignment = .center
        return label
    }()
    
    lazy var textView:UITextView = {
        let t = UITextView()
        t.text = """
            An act of true love will thaw a frozen heart.
            真爱能融化冰冻的心。
            """
        t.font = UIFont(name: "DIN Alternate Bold", size: 15.0)
        t.textAlignment = .center
        return t
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tipLabel)
        view.addSubview(textView)
        
        tipLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.top.equalTo(100)
        }
        
        textView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(tipLabel.snp.bottom).offset(20)
            make.height.equalTo(200)
        }
    }

}
