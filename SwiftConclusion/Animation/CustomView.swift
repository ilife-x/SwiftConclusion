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
//        drawCircleArc(rect)
//        drawDashCircle(rect)
//        drawText(rect)
//        drawTextInPath(rect)
//        drawImage(rect)
//        drawContextStackTest(rect)
//        drawRectRotate(rect)
//        drawRectTranslate(rect)
        drawRectScale(rect)
    }
    //11.矩阵操作 平移/旋转/缩放
    func drawRectRotate(_ rect:CGRect) {
        
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        //旋转角度
        //矩阵操作方法必须再路径绘制之前,旋转的是整个layer
        ctx.rotate(by: .pi/4)
        ctx.addRect(CGRect(x: 200, y: 50, width: 100, height: 100))
        ctx.strokePath()
        
    }
    
    func drawRectTranslate(_ rect:CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        //旋转角度
        //矩阵操作方法必须再路径绘制之前,旋转的是整个layer
        ctx.translateBy(x: 50, y: 50)
        ctx.addRect(CGRect(x: 200, y: 50, width: 100, height: 100))
        ctx.strokePath()
    }
    
    func drawRectScale(_ rect:CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        //旋转角度
        //矩阵操作方法必须再路径绘制之前,旋转的是整个layer
        ctx.scaleBy(x: 1, y: 1.5)
        ctx.addRect(CGRect(x: 200, y: 50, width: 100, height: 100))
        ctx.strokePath()
    }
    
    //10.图形上线文栈
    //防止状态贯穿复用
    func drawContextStackTest( _ rect:CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        
        ctx.saveGState()
        ctx.move(to: CGPoint(x: 100, y: 100))
        ctx.setLineCap(CGLineCap.round)
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.addLine(to: CGPoint(x: 200, y: 200))
        ctx.strokePath()
        ctx.restoreGState()

        
        ctx.move(to: CGPoint(x: 200, y: 100))
        ctx.setStrokeColor(UIColor.green.cgColor)
        ctx.addLine(to: CGPoint(x: 100, y: 200))
        
        ctx.strokePath()
        
    }
    
    
    //9.绘图
    func drawImage(_ rect :CGRect){
        let img = UIImage(named: "tabbar_animation_nomal")
        //定点绘制
//        img?.draw(at: CGPoint(x: 0, y: 0))
        //平铺
//        img?.drawAsPattern(in: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        //拉伸绘制
        img?.draw(in: CGRect(x: 100, y: 100, width: 100, height: 100))
    }
    
    
    
    //8.在指定区域绘制文字
    func drawTextInPath(_ rect:CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        //0.保存初始状态
        ctx.saveGState()
        
        //显示参考区域范围
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: 100, y: 100, width: 200, height: 100))
        ctx.addPath(path)
        ctx.setLineDash(phase: 0.0, lengths: [3,3])
        ctx.strokePath()
        
        //在指定区域绘制文本
        //1.坐标系翻转
        ctx.textMatrix = CGAffineTransform.identity
        ctx.translateBy(x: 0, y: self.bounds.height)
        ctx.scaleBy(x: 1, y: -1)
        
        //2.文本
        let attr = [
            NSAttributedString.Key.foregroundColor:UIColor.red,
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 6)
                ]
        let str = """
                  “但是，叶凡却怡然不惧，一道黑色的圣力打出，丝丝缕缕，将太阳真火都浇灭了，温度骤降。
                  　　太阴圣力！
                  　　这是他在练太阴与太阳古经时，所化生出来的至阴圣力，神能强大，可以灭太阳真火。
                  　　突然，一片刺目的金光飞出，八十一杆金色的大旗猎猎作响，以璀璨神金铸成，连旗面都是黄金色，上秀神鸟金乌，排列虚空中，将叶凡困在了里面。
                  　　“陆鸦的金乌大旗！”人们吃惊，这可是有血淋漓的传说啊。”

                  摘录来自: 辰东. “遮天》（精校版全本）。” Apple Books.
                  """
                
        
        let mStr = NSAttributedString(string: str)
        
        //3.创建frame
        let framesetter = CTFramesetterCreateWithAttributedString(mStr)
        
        let frame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: mStr.length), path, attr as CFDictionary)
        
        //4.绘制frame
        CTFrameDraw(frame, ctx)
        
        //0.恢复初始状态
        ctx.restoreGState()
    }
    
    
    
    
    //7.绘制文字
    /**
     除了前面使用的三个属性外，文字绘制支持的所有属性如下：
     NSFontAttributeName 设置字体属性，默认值：12号的系统字体
     NSForegroundColorAttributeName 设置字体颜色，取值为 UIColor对象，默认为黑色
     NSBackgroundColorAttributeName 设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明
     NSLigatureAttributeName 设置连体属性，取值为整数，0 表示没有连体字符，1 表示使用默认的连体字符
     NSKernAttributeName 设定字符间距，取值为整数，正值间距加宽，负值间距变窄
     NSStrikethroughStyleAttributeName 设置删除线，取值为整数
     NSStrikethroughColorAttributeName 设置删除线颜色，取值为 UIColor 对象，默认值为黑色
     NSUnderlineStyleAttributeName 设置下划线，取值为整数，枚举常量 NSUnderlineStyle中的值，与删除线类似
     NSUnderlineColorAttributeName 设置下划线颜色，取值为 UIColor 对象，默认值为黑色
     NSStrokeWidthAttributeName 设置笔画宽度，取值为整数，负值填充效果，正值中空效果
     NSStrokeColorAttributeName 填充部分颜色，不是字体颜色，取值为 UIColor 对象
     NSShadowAttributeName 设置阴影属性，取值为 NSShadow 对象
     NSTextEffectAttributeName 设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用
     NSBaselineOffsetAttributeName 设置基线偏移值，取值为 float,正值上偏，负值下偏
     NSObliquenessAttributeName 设置字形倾斜度，取值为 float,正值右倾，负值左倾
     NSExpansionAttributeName 设置文本横向拉伸属性，取值为 float,正值横向拉伸文本，负值横向压缩文本
     NSWritingDirectionAttributeName 设置文字书写方向，从左向右书写或者从右向左书写
     NSVerticalGlyphFormAttributeName 设置文字排版方向，取值为整数，0 表示横排文本，1 表示竖排文本
     NSLinkAttributeName 设置链接属性，点击后调用浏览器打开指定URL地址
     NSAttachmentAttributeName 设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
     NSParagraphStyleAttributeName 设置文本段落排版格式，取值为 NSParagraphStyle 对象
     */
    func drawText(_ rect: CGRect) {
        let str:String = "笙歌不见故人散,十里长欢再难寻"
        let attributes = [
            NSAttributedString.Key.foregroundColor:UIColor.red,
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)
        ]
        (str as NSString) .draw(in: CGRect(x: 100, y: 100, width: 200, height: 200), withAttributes:attributes)
        
        //(str as NSString).draw(at: CGPoint(x:0,y:0), withAttributes: attributes)

    }
    
    //6.虚线圆
    func drawDashCircle(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
        ctx.addPath(path)
        ctx.setLineDash(phase: 0, lengths: [3,6])//3+6 为9 ,是360的除数,如果是正圆,接缝处比较均匀
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.strokePath()
        

       
    }
    
    //5.画圆弧
    func drawCircleArc(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {return}
        
//        let path = CGMutablePath()
        ctx.move(to: CGPoint(x: 200, y: 200))
        ctx.addLine(to: CGPoint(x: 200, y: 150))
        //圆 顺时针:0 0.5pi pi 1.5pi 2pi false:顺时针
        ctx.addArc(center: CGPoint(x: 200, y: 200), radius: 50.0, startAngle: .pi * 1.5, endAngle: .pi * 2 , clockwise: false)
//        path.closeSubpath()
        ctx.closePath()
//        ctx.addPath(path)
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillPath()
        

    }
    
    
    //4.画圆
    //4.1
    func drawArc(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addArc(center: CGPoint(x: 200, y: 200), radius: 50, startAngle: 0, endAngle: .pi * 2, clockwise:false )
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
//        CGContext.closePath(ctx)()
//        CGContext.strokePath(ctx)()
        
        
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
