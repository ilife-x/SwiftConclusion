//
//  CircleProgressView.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/26.
//

import UIKit

class CircleProgressView: UIView {
    var angle:Double = 0{
        willSet{
            setNeedsDisplay()
        }
    }
    
    var timer = Timer()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
//        timer = Timer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
//        RunLoop.main.add(timer, forMode: .common)
        
        
        
        
        
    }
    
    func fire() {
        timer.fire()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func runTimer() {
        debugPrint("-----")
        angle += 10/360
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        //注意坐标系的宽高对应
        //(1). 灰色进度条
        ctx.addArc(center: CGPoint(x: kScreenWidth/2, y: self.bounds.size.height/2), radius: 50, startAngle: 0, endAngle: .pi*2, clockwise: false)
        ctx.setStrokeColor(UIColor.lightGray.cgColor)
        ctx.setLineWidth(3)
        ctx.strokePath()
        //(2). 进度条
        ctx.addArc(center: CGPoint(x: kScreenWidth/2, y: self.bounds.size.height/2), radius: 50, startAngle: 0, endAngle: CGFloat(angle), clockwise: false)
        ctx.setStrokeColor(UIColor.systemBlue.cgColor)
        ctx.setLineWidth(3)
        ctx.strokePath()
    }
    
}
