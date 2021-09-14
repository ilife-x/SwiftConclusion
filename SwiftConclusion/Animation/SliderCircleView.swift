//
//  SliderCircleView.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/26.
//

import UIKit

class SliderCircleView: UIView {
    
    var radius:CGFloat = 10 {
        willSet{
            //强制刷新
            setNeedsDisplay()
            debugPrint("*****\(newValue)")

        }
    }
    
    lazy var sliderView:UISlider = {
        let s = UISlider()
        let action = UIAction { [self] action in
            radius = CGFloat(s.value)
        }
        s.frame = CGRect(x: 50, y: 280, width: kScreenWidth - 100, height: 20)
//        s.addAction(action, for: .touchDragInside)
        s.minimumValue = 10
        s.maximumValue = 100
        return s
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.addSubview(sliderView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        debugPrint("//////")
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //注意坐标系的宽高对应
        ctx.addArc(center: CGPoint(x: kScreenWidth/2, y: self.bounds.size.height/2), radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        ctx.setFillColor(UIColor.systemBlue.cgColor)
        ctx.fillPath()
    }

}
