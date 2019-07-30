//
//  ViewController.swift
//  Bose UI
//
//  Created by Eric Dolecki on 7/29/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myScrollView: UIScrollView!
    var darkButton:     BoseButton!
    var lightButton:    BoseButton!
    var primaryButton:  BoseButton!
    var primDest:       BoseButton!
    var secondary:      BoseButton!
    var secondDest:     BoseButton!
    var facebookButton: BoseButton!
    var amazonButton:   BoseButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myScrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 400))
        myScrollView.layer.borderColor = UIColor.lightGray.cgColor
        myScrollView.layer.borderWidth = 1.0
        
        darkButton = BoseButton(width: self.view.frame.width - 80, title: "Dark Button", type: .Dark)
        darkButton.center = CGPoint(x: self.view.frame.midX, y: 30)
        darkButton.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        lightButton = BoseButton(width: self.view.frame.width - 80, title: "Light Button", type: .Light)
        lightButton.center = CGPoint(x: self.view.frame.midX, y: darkButton.frame.origin.y + darkButton.frame.height + 30)
        lightButton.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        primaryButton = BoseButton(width: self.view.frame.width - 80, title: "Primary Button", type: .Primary)
        primaryButton.center = CGPoint(x: self.view.frame.midX, y: lightButton.frame.origin.y + lightButton.frame.height + 30)
        primaryButton.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        primDest = BoseButton(width: self.view.frame.width - 80, title: "Primary Destructive", type: .PrimaryDestructive)
        primDest.center = CGPoint(x: self.view.frame.midX, y: primaryButton.frame.origin.y + primaryButton.frame.height + 30)
        primDest.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        secondary = BoseButton(width: self.view.frame.width - 80, title: "Secondary", type: .Secondary)
        secondary.center = CGPoint(x: self.view.frame.midX, y: primDest.frame.origin.y + primDest.frame.height + 30)
        secondary.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        secondDest = BoseButton(width: self.view.frame.width - 80, title: "Secondary Destructive", type: .SecondaryDestructive)
        secondDest.center = CGPoint(x: self.view.frame.midX, y: secondary.frame.origin.y + secondary.frame.height + 30)
        secondDest.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        facebookButton = BoseButton(width: self.view.frame.width - 80, title: "Facebook", type: .Facebook)
        facebookButton.center = CGPoint(x: self.view.frame.midX, y: secondDest.frame.origin.y + secondDest.frame.height + 30)
        facebookButton.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        amazonButton = BoseButton(width: self.view.frame.width - 80, title: "Amazon", type: .Amazon)
        amazonButton.center = CGPoint(x: self.view.frame.midX, y: facebookButton.frame.origin.y + facebookButton.frame.height + 30)
        amazonButton.addTarget(self, action: #selector(buttonReleased(sender:)), for: .touchUpInside)
        
        myScrollView.addSubview(darkButton)
        myScrollView.addSubview(lightButton)
        myScrollView.addSubview(primaryButton)
        myScrollView.addSubview(primDest)
        myScrollView.addSubview(secondary)
        myScrollView.addSubview(secondDest)
        myScrollView.addSubview(facebookButton)
        myScrollView.addSubview(amazonButton)
        self.view.addSubview(myScrollView)
        
        myScrollView.contentSize = CGSize(width: myScrollView.frame.width, height: amazonButton.frame.origin.y + amazonButton.frame.height + 30)
    }
    
    @objc func buttonReleased(sender: BoseButton) {
        print("release.")
    }
}

