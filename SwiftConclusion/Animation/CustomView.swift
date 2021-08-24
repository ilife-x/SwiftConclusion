//
//  CustomView.swift
//  SwiftConclusion
//
//  Created by xiao on 2021/8/24.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //修改view的背景色(画布)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
//        drawLine(rect)
//        drawTriangle(rect)
//        drawRectangular_first(rect)
//        drawRectangular_sec(rect)
//        drawRectangular_thir(rect: rect)
//        drawArc(rect)
//        drawEclips(rect)
        drawCircleArc(rect)
    }
    
    //5.画圆弧
    func drawCircleArc(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        ctx.addArc(center: CGPoint(x: 200, y: 200), radius: 50.0, startAngle: 0, endAngle: -CGFloat(Double.pi)/2, clockwise: false)
        ctx.closePath()
        ctx.strokePath()
        
//        CGContext.closePath(ctx)()
//        CGContext.strokePath(ctx)()
    }
    
    
    //4.画圆
    //4.1
    func drawArc(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addArc(center: CGPoint(x: 200, y: 200), radius: 50, startAngle: 0, endAngle: CGFloat(360), clockwise:false )
        CGContext.strokePath(ctx!)()
        //实心填充
//        CGContext.fillPath(ctx!)(using: .winding)
        
    }
    
    //4.2
    func drawEclips(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        ctx.addEllipse(in: CGRect(x: 100, y: 100, width: 200, height: 200))
        ctx.setStrokeColor(UIColor.lightGray.cgColor)
        CGContext.strokePath(ctx)()
        
        
    }
    
    
    //3.画四边形
    func drawRectangular_thir(rect:CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else{return}
        ctx.move(to: CGPoint(x: 100, y: 100))
        ctx.addLine(to: CGPoint(x: 200, y: 100))
        ctx.setLineWidth(100)
        ctx.setFillColor(UIColor.green.cgColor)
        CGContext.strokePath(ctx)()
        
    }
    
    
    //3.3
    
    //3.2 通过addRect来画,空心
    func drawRectangular_sec(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addRect(CGRect(x: 100, y: 100, width: 100, height: 100))
        CGContext.strokePath(ctx!)()
    }

    //3.1-通过点/线来画
    func drawRectangular_first(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.move(to: CGPoint(x: 100, y: 100))
        ctx?.addLine(to: CGPoint(x: 100, y: 200))
        ctx?.addLine(to: CGPoint(x: 200, y: 200))
        ctx?.addLine(to: CGPoint(x: 200, y: 100))
        ctx?.closePath()
        CGContext.strokePath(ctx!)()
    }
    
    
    
    //2.画三角形
    func drawTriangle(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.move(to: CGPoint(x: 100, y: 100))
        ctx?.addLine(to: CGPoint(x: 100, y: 200))
        ctx?.addLine(to: CGPoint(x: 200, y: 200))
        ctx?.closePath()
        CGContext.strokePath(ctx!)()
    }
    
    
    //1.画线段
    func drawLine(_ rect:CGRect) {
        //1.获取图形上下文
        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        //2.设置起点
        ctx.move(to: CGPoint(x: 100, y: 100))
        //设置终点
        ctx.addLine(to: CGPoint(x: 200, y: 200))
        //线条颜色
        ctx.setStrokeColor(UIColor.red.cgColor)
        //顶点样式
        ctx.setLineCap(.round)
        //线宽
        ctx.setLineWidth(CGFloat(5))
        //渲染第一条线:注意()为调用函数
        CGContext.strokePath(ctx)()
        
        //第二条线
        ctx.move(to: CGPoint(x: 100, y: 200))
        ctx.addLine(to: CGPoint(x: 200, y: 100))
        ctx.setStrokeColor(UIColor.black.cgColor)
        ctx.setLineWidth(CGFloat(10))
        ctx.setAlpha(CGFloat(0.5))
        ctx.setLineCap(.butt)
        ctx.setLineJoin(.miter)
        CGContext.strokePath(ctx)()
    }

}
