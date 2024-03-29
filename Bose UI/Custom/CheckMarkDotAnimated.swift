//
//  CheckMarkDotAnimated.swift
//  Bose UI
//
//  Created by Eric Dolecki on 8/2/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit
import Foundation

class CheckMarkDotAnimated: UIView, CAAnimationDelegate {

    // MARK: Public variables
    public var initialLayerColor: UIColor = UIColor.blue {
        didSet {
            initialLayer.strokeColor = initialLayerColor.cgColor
        }
    }
    public var animatedLayerColor: UIColor = UIColor.red {
        didSet {
            animatedLayer?.strokeColor = animatedLayerColor.cgColor
        }
    }
    public var strokeWidth: CGFloat = 4 {
        didSet {
            initialLayer.lineWidth = strokeWidth
            animatedLayer?.lineWidth = strokeWidth
        }
    }
    public var animated: Bool = false {
        didSet {
            if animated {
                animatedLayer = createCheckmarkLayer(strokeColor: animatedLayerColor, strokeEnd: 0)
                layer.addSublayer(animatedLayer!)
            }
        }
    }
    
    // MARK: Private variables
    private lazy var initialLayer: CAShapeLayer = {
        return self.createCheckmarkLayer(strokeColor: self.initialLayerColor, strokeEnd: 1)
    }()
    
    private var animatedLayer: CAShapeLayer?
    
    // MARK: Overriding methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    var initialStrokeColor: UIColor = UIColor.blue
    var animateStrokeColor: UIColor = UIColor.red
    
    init(frame: CGRect, initialColor: UIColor, animatedColor: UIColor) {
        super.init(frame: frame)
        self.animateStrokeColor = animatedColor
        self.initialStrokeColor = initialColor
        configureView()
    }
    
    // MARK: Public methods
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureView()
    }
    public func animate(duration: TimeInterval = 0.4) {
        guard let animatedLayer = animatedLayer else { return }
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animatedLayer.strokeEnd = 1
        animatedLayer.add(animation, forKey: "animateCheckmark")
    }
    
    public func reset(withFade: Bool = false)
    {
        if !withFade {
            self.animatedLayer?.removeFromSuperlayer()
            self.configureView()
        } else {
            animatedLayer?.removeAllAnimations()
            let animcolor = CABasicAnimation(keyPath: "strokeColor")
            animcolor.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animcolor.fromValue         = animatedLayerColor.cgColor
            animcolor.toValue           = UIColor.clear.cgColor
            animcolor.duration          = 0.5
            animcolor.delegate = self
            animatedLayer?.strokeEnd = 0
            animatedLayer!.add(animcolor, forKey: "strokeColor")
        }
    }
    
    // When animation above completes, we reset this. Try to alleviate a UI flash.
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            self.animatedLayer?.removeFromSuperlayer()
            self.configureView()
        }
    }
    
    // MARK: Private methods
    private func configureView() {
        backgroundColor = UIColor.clear
        initialLayerColor = initialStrokeColor //UIColor.blue
        animatedLayerColor = animateStrokeColor //UIColor.red
        strokeWidth = 4
        animated = false
        
        layer.addSublayer(initialLayer)
    }
    private func createCheckmarkLayer(strokeColor: UIColor, strokeEnd: CGFloat) -> CAShapeLayer {
        let scale = frame.width / 100
        let centerX = frame.size.width / 2
        let centerY = frame.size.height / 2
        let sixOclock = CGFloat(Double.pi / 2)
        
        let checkmarkPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: centerX, startAngle:  sixOclock, endAngle: sixOclock * 5, clockwise: true)
        checkmarkPath.move(to: CGPoint(x: centerX - 23 * scale, y: centerY - 1 * scale))
        checkmarkPath.addLine(to: CGPoint(x: centerX - 6 * scale, y: centerY + 15.9 * scale))
        checkmarkPath.addLine(to: CGPoint(x: centerX + 22.8 * scale, y: centerY - 13.4 * scale))
        
        let checkmarkLayer = CAShapeLayer()
        checkmarkLayer.fillColor = UIColor.clear.cgColor
        checkmarkLayer.lineWidth = strokeWidth
        checkmarkLayer.path = checkmarkPath.cgPath
        checkmarkLayer.strokeEnd = strokeEnd
        checkmarkLayer.strokeColor = strokeColor.cgColor
        checkmarkLayer.lineCap = CAShapeLayerLineCap.round
        checkmarkLayer.lineJoin = CAShapeLayerLineJoin.round
        
        return checkmarkLayer
    }
}
