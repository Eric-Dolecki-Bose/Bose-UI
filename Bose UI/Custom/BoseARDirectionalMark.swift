//
//  BoseARDirectionalMark.swift
//  Bose UI
//
//  Created by Eric Dolecki on 8/1/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

enum LookDirection {
    case Up, Down, Left, Right
}

class BoseARDirectionalMark: UIView
{
    private var myLookDirection: LookDirection = .Up
    private var detectionHappened = false
    private var detectionDot: UIView!
    private var arrowLayer: CAShapeLayer!
    
    init(direction: LookDirection)
    {
        let frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        myLookDirection = direction
        super.init(frame: frame)
        self.layer.borderColor = UIColor.FlatColor.Gray.Iron.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        
        detectionDot = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width - 15, height: self.frame.height - 15))
        detectionDot.layer.cornerRadius = detectionDot.frame.width / 2
        detectionDot.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        detectionDot.center = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addSubview(detectionDot)
        
        let arrow = UIBezierPath()
        arrow.addArrow(start: CGPoint(x: detectionDot.frame.width / 2, y: 17),
                       end: CGPoint(x: detectionDot.frame.width / 2, y: 7),
                       pointerLineLength: 6,
                       arrowAngle: CGFloat(Double.pi / 4))
        arrowLayer = CAShapeLayer()
        arrowLayer.strokeColor = UIColor.FlatColor.Gray.Silver.cgColor
        arrowLayer.lineWidth = 2
        arrowLayer.path = arrow.cgPath
        arrowLayer.fillColor = UIColor.clear.cgColor
        arrowLayer.lineJoin = CAShapeLayerLineJoin.round
        arrowLayer.lineCap = CAShapeLayerLineCap.round
        detectionDot.layer.addSublayer(arrowLayer)
        
        if direction == .Up {
            detectionDot.transform = CGAffineTransform.init(rotationAngle: CGFloat(deg2rad(0)))
        } else if direction == .Right {
            detectionDot.transform = CGAffineTransform.init(rotationAngle: CGFloat(deg2rad(90)))
        } else if direction == .Down {
            detectionDot.transform = CGAffineTransform.init(rotationAngle: CGFloat(deg2rad(180)))
        } else if direction == .Left {
            detectionDot.transform = CGAffineTransform.init(rotationAngle: CGFloat(deg2rad(270)))
        }
    }
    
    // Only fire once. Light this mark up.
    public func wasLookedAt() {
        if detectionHappened == false {
            detectionHappened = true
            detectionDot.backgroundColor = UIColor.FlatColor.Green.PersianGreen
            arrowLayer.strokeColor = UIColor.white.cgColor
        }
    }
    
    // Resets the UI. The user looked away from this direction.
    public func resetDetection() {
        detectionHappened = false
        detectionDot.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        arrowLayer.strokeColor = UIColor.FlatColor.Gray.Silver.cgColor
    }
    
    private func deg2rad(_ number: Double) -> Double {
        return number * .pi / 180
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
