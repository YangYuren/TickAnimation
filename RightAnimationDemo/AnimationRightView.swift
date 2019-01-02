//
//  AnimationRightView.swift
//  RightAnimationDemo
//
//  Created by Aeyanr on 2018/9/9.
//  Copyright © 2018年 Aeyanr. All rights reserved.
//

import UIKit 

@objc protocol AnimationRightDelegate: NSObjectProtocol {
    
    @objc func AnimationRightValueChange(view: AnimationRightView)
}

class AnimationRightView: UIView {
    
    weak var delegate: AnimationRightDelegate?
    
    fileprivate var backColor: UIColor = UIColor.gray
    
    fileprivate var tickColor: UIColor = UIColor.green
    
    fileprivate var shaper: CAShapeLayer?

    var isTick: Bool = false {
        didSet{
            if let delegate = self.delegate, delegate.responds(to: #selector(AnimationRightDelegate.AnimationRightValueChange(view:))){
                delegate.AnimationRightValueChange(view: self)
            }
            setNeedsDisplay()
        }
    }
    
    //初始化方法
    init(frame: CGRect, backColor: UIColor, tickColor: UIColor) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.backColor = backColor
        self.tickColor = tickColor
        isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(singleTap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapAction(){
        isTick = !isTick
    }
    //画出曲线
    override func draw(_ rect: CGRect) {
        if isTick {
            let center = CGPoint(x: rect.size.width*0.5, y: rect.size.width*0.5)
            let path = UIBezierPath(arcCenter: center, radius: (rect.size.width*0.5 - rect.size.width*0.03), startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
            backColor.set()
            path.fill()
            let tickPath = UIBezierPath()
            tickPath.lineWidth = rect.size.width*0.06
            tickPath.move(to: CGPoint(x: rect.size.width*0.23, y: rect.size.height*0.43))
            tickPath.addLine(to: CGPoint(x: rect.size.width*0.45, y: rect.size.height*0.7))
            tickPath.addLine(to: CGPoint(x: rect.size.width*0.79, y: rect.size.height*0.35))
            //创建CAShapeLayer
            let shape = CAShapeLayer()
            shaper = shape
            shape.path = tickPath.cgPath
            shape.lineWidth = tickPath.lineWidth
            shape.fillColor = UIColor.clear.cgColor
            shape.strokeColor = tickColor.cgColor
            shape.lineCap = kCALineCapRound
            shape.lineJoin = kCALineJoinRound
            //3、给CAShapeLayer添加动画
            let checkAnimation = CABasicAnimation(keyPath: "strokeEnd")
            checkAnimation.isRemovedOnCompletion = true
            checkAnimation.duration = 0.5
            checkAnimation.fromValue = 0.0
            checkAnimation.toValue = 1.0
            shape.add(checkAnimation, forKey: "strokeEnd")
            //4、把CAShapeLayer添加给自己view的layer
            layer.addSublayer(shape)
        } else {
            shaper?.removeFromSuperlayer()
            let center = CGPoint(x: rect.size.width*0.5, y: rect.size.width*0.5)
            let path = UIBezierPath(arcCenter: center, radius: (rect.size.width*0.5 - rect.size.width*0.03), startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
            UIColor.gray.set()
            path.stroke()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
