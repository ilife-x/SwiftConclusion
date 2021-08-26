//
//  PattenView.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/26.
//

import UIKit

class PattenView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        //图片图形上下文
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        
        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        ctx.move(to: CGPoint(x: 0, y: 0))
        ctx.addLine(to: CGPoint(x: 30, y: 0))
        ctx.setLineWidth(1)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokePath()
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.backgroundColor = UIColor(patternImage: img!)
    }

    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        ctx.addRect(CGRect(x: 50, y: 50, width: 100, height: 100))
        ctx.setLineWidth(1)
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.strokePath()
    }
   
}
