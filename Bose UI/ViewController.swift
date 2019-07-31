//
//  ViewController.swift
//  Bose UI
//
//  Created by Eric Dolecki on 7/29/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

// For themes, each UI component needs to be subclasses (I think).

class ViewController: UIViewController {

    var myScrollView:   UIScrollView!
    var darkButton:     BoseButton!
    var lightButton:    BoseButton!
    var primaryButton:  BoseButton!
    var primDest:       BoseButton!
    var secondary:      BoseButton!
    var secondDest:     BoseButton!
    var facebookButton: BoseButton!
    var amazonButton:   BoseButton!
    var currentTheme = "light"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(brightnessChanged), name: UIScreen.brightnessDidChangeNotification, object: nil)
        print("Screen brightness: \(UIScreen.main.brightness)")
        
        myScrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 350))
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
        
        // Place colored views to show off the theme colors.
        
        var positionY = amazonButton.frame.origin.y + amazonButton.frame.height + 20
        let dictionary: [String: UIColor] = [
            "Fern" : UIColor.FlatColor.Green.Fern,
            "Mountain Meadow" : UIColor.FlatColor.Green.MountainMeadow,
            "Chateau Green" : UIColor.FlatColor.Green.ChateauGreen,
            "Persian Green" : UIColor.FlatColor.Green.PersianGreen,
            "Almond Frost" : UIColor.FlatColor.Gray.AlmondFrost,
            "White Smoke" : UIColor.FlatColor.Gray.WhiteSmoke,
            "Iron Gray" : UIColor.FlatColor.Gray.IronGray,
            "Iron" : UIColor.FlatColor.Gray.Iron,
            "Picton Blue" : UIColor.FlatColor.Blue.PictonBlue,
            "Mariner" : UIColor.FlatColor.Blue.Mariner,
            "Curious Blue" : UIColor.FlatColor.Blue.CuriousBlue,
            "Denim" : UIColor.FlatColor.Blue.Denim,
            "Wisternia" : UIColor.FlatColor.Violet.Wisteria,
            "Blue Gem" : UIColor.FlatColor.Violet.BlueGem,
            "Chambray" : UIColor.FlatColor.Blue.Chambray,
            "Blue Whale" : UIColor.FlatColor.Blue.BlueWhale,
            "Energy" : UIColor.FlatColor.Yellow.Energy,
            "Turbo" : UIColor.FlatColor.Yellow.Turbo,
            "Neon Carrot" : UIColor.FlatColor.Orange.NeonCarrot,
            "Sun" : UIColor.FlatColor.Orange.Sun,
            "Terra Cotta" : UIColor.FlatColor.Red.TerraCotta,
            "Valencia" : UIColor.FlatColor.Red.Valencia,
            "Cinnabar" : UIColor.FlatColor.Red.Cinnabar,
            "Well Read" : UIColor.FlatColor.Red.WellRead
        ]
        
        for (key, value) in dictionary {
            //print("\(key): \(value)")
            let view = UIView(frame: CGRect(x: 40, y: positionY, width: amazonButton.frame.width, height: 30))
            let label = UILabel(frame: CGRect(x: 10, y: 5, width: view.frame.width - 10, height: 20))
            label.textColor = UIColor.white
            if key == "Turbo" || key == "Energy" || key == "White Smoke" || key == "Iron" {
                label.textColor = UIColor.darkGray
            }
            label.font = UIFont(name: "GothamSSm-Bold", size: 9.0)
            label.text = key.uppercased()
            view.addSubview(label)
            view.backgroundColor = value
            myScrollView.addSubview(view)
            positionY += 31
        }
        
        myScrollView.contentSize = CGSize(width: myScrollView.frame.width, height: positionY + 10)
    }
    
    // The range is 0.0 - 1.0
    // The idea here is that if the screen dims automatically because
    // the user is in a dark environment, we can assume that we could
    // change the theme being used (to come soon). i.e. Dark mode. I do
    // not have a good handle on the value yet though.
    @objc func brightnessChanged() {
        let brightness:CGFloat = UIScreen.main.brightness
        if brightness < 0.3
        {
            if currentTheme == "light" {
                currentTheme = "dark"
                let theme = DarkTheme()
                theme.apply(for: UIApplication.shared)
            }
            
        } else {
            if currentTheme == "dark" {
                currentTheme = "light"
                let theme = LightTheme()
                theme.apply(for: UIApplication.shared)
            }
        }
    }
    
    // User-controlled theme switcher.
    @IBAction func switchChanged(_ sender: AppSwitch) {
        let theme: Theme
        if sender.isOn == true {
            theme = DarkTheme()
        } else {
            theme = LightTheme()
        }
        theme.apply(for: UIApplication.shared)
    }
    
    @objc func buttonReleased(sender: BoseButton) {
        print("release.")
    }
}

