//
//  CheckMarkDot.swift
//  Bose UI
//
//  Created by Eric Dolecki on 8/2/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class CheckMarkDot: UIView {

    init() {
        let frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.FlatColor.Gray.WhiteSmoke.cgColor
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
        
        // Create the path.
        let check = UIBezierPath()
        check.move(to: CGPoint(x: 18, y: 33))
        check.addLine(to: CGPoint(x: 25, y: 40))
        check.addLine(to: CGPoint(x: 45, y: 20))
        
        // Apply the path to a shape layer.
        let checkLayer = CAShapeLayer()
        checkLayer.strokeColor = UIColor.black.cgColor
        checkLayer.lineWidth = 4
        checkLayer.path = check.cgPath
        checkLayer.fillColor = UIColor.clear.cgColor
        checkLayer.lineJoin = CAShapeLayerLineJoin.round
        checkLayer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(checkLayer)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
