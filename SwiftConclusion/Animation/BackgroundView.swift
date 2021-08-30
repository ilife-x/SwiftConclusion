//
//  BackgroundView.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/26.
//

import UIKit

class BackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        
        ctx.addRect(CGRect(x: 10, y: 10, width: 200, height: 200))
        ctx.setStrokeColor(UIColor.green.cgColor)
        ctx.strokePath()
    }
}
