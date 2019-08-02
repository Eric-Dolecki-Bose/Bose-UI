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
    var currentTheme =  "light"
    var upDetectionDot: BoseARDirectionalMark!
    var boseInstruct:   BoseInstructionPanel!
    var checkmark:      CheckMarkDot!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(brightnessChanged), name: UIScreen.brightnessDidChangeNotification, object: nil)
        print("Screen brightness: \(UIScreen.main.brightness)")
        
        upDetectionDot = BoseARDirectionalMark(direction: .Up)
        upDetectionDot.center = CGPoint(x: self.view.frame.width / 2, y: 70)
        //upDetectionDot.wasLookedAt()
        
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
        self.view.addSubview(upDetectionDot)
        self.view.addSubview(myScrollView)
        
        // Place colored views to show off the theme colors.
        
        boseInstruct = BoseInstructionPanel(width: amazonButton.frame.width + 20, title: "Perform AR Input", message: "Tap and hold for 1 second to control your AR app.")
        boseInstruct.center = CGPoint(x: self.view.frame.midX, y: 0)
        boseInstruct.frame.origin.y = amazonButton.frame.origin.y + amazonButton.frame.height + 20
        myScrollView.addSubview(boseInstruct)
        
        checkmark = CheckMarkDot()
        checkmark.center = CGPoint(x: self.view.frame.midX, y: 0)
        checkmark.frame.origin.y = boseInstruct.frame.origin.y + boseInstruct.frame.height + 20
        myScrollView.addSubview(checkmark)
        
        var positionY = checkmark.frame.origin.y + checkmark.frame.height + 20
        
        // Arrays are ordered - dictionaries are not. Array of tuples.
        let array = [
            
                (name:"Grays", color: UIColor.black),
                     
                     (name:"White Smoke", color: UIColor.FlatColor.Gray.WhiteSmoke),
                     (name:"Gainsboro", color: UIColor.FlatColor.Gray.Gainsboro),
                     (name:"Light Gray", color: UIColor.FlatColor.Gray.LightGray),
                     (name:"Iron", color: UIColor.FlatColor.Gray.Iron),
                     (name:"Silver", color: UIColor.FlatColor.Gray.Silver),
                     (name:"Medium Gray", color: UIColor.FlatColor.Gray.MediumGray),
                     (name:"Gray", color: UIColor.FlatColor.Gray.Gray),
                     (name:"Iron Gray", color: UIColor.FlatColor.Gray.IronGray),
                     (name:"Dim Gray", color: UIColor.FlatColor.Gray.DimGray),
                     (name:"Slate Gray", color: UIColor.FlatColor.Gray.SlateGray),
                     (name:"Almond Frost", color: UIColor.FlatColor.Gray.AlmondFrost),
                     
                (name:"Greens", color: UIColor.black),
                     
                     (name:"Fern", color:UIColor.FlatColor.Green.Fern),
                     (name:"Chateau Green", color: UIColor.FlatColor.Green.ChateauGreen),
                     (name:"Mountain Meadow", color: UIColor.FlatColor.Green.MountainMeadow),
                     (name:"Persian Green", color: UIColor.FlatColor.Green.PersianGreen),
                     
                (name:"Blues", color: UIColor.black),
                     
                     (name:"Picton Blue", color: UIColor.FlatColor.Blue.PictonBlue),
                     (name:"Mariner", color: UIColor.FlatColor.Blue.Mariner),
                     (name:"Curious Blue", color: UIColor.FlatColor.Blue.CuriousBlue),
                     (name:"Denim", color: UIColor.FlatColor.Blue.Denim),
                     (name:"Chambray", color: UIColor.FlatColor.Blue.Chambray),
                     (name:"Blue Whale", color: UIColor.FlatColor.Blue.BlueWhale),
                     
                (name:"Violets", color: UIColor.black),
                     
                     (name:"Wisteria", color: UIColor.FlatColor.Violet.Wisteria),
                     (name:"Blue Gem", color: UIColor.FlatColor.Violet.BlueGem),
                     
                (name:"Yellows", color: UIColor.black),
                     
                     (name:"Energy", color: UIColor.FlatColor.Yellow.Energy),
                     (name:"Turbo", color: UIColor.FlatColor.Yellow.Turbo),
                     
                (name:"Oranges", color: UIColor.black),
                     
                     (name:"Neon Carrot", color: UIColor.FlatColor.Orange.NeonCarrot),
                     (name:"Sun", color: UIColor.FlatColor.Orange.Sun),
                     
                (name:"Reds", color: UIColor.black),
                     
                     (name:"Terra Cotta", color: UIColor.FlatColor.Red.TerraCotta),
                     (name:"Cinnabar", color: UIColor.FlatColor.Red.Cinnabar),
                     (name:"Valencia", color: UIColor.FlatColor.Red.Valencia),
                     (name:"Well Read", color: UIColor.FlatColor.Red.WellRead)
                    ]
        
        for item in array {
            let view = UIView(frame: CGRect(x: 40, y: positionY, width: amazonButton.frame.width, height: 30))
            let label = UILabel(frame: CGRect(x: 10, y: 5, width: view.frame.width - 10, height: 20))
            label.textColor = UIColor.white
            if item.name == "Turbo" || item.name == "Energy" || item.name == "White Smoke" || item.name == "Iron" ||
                item.name == "Gainsboro" || item.name == "Light Gray" || item.name == "Silver" {
                label.textColor = UIColor.darkGray
            }
            label.font = UIFont(name: "GothamSSm-Bold", size: 9.0)
            label.text = item.name.uppercased()
            view.addSubview(label)
            view.backgroundColor = item.color
            myScrollView.addSubview(view)
            positionY += 31
        }
        myScrollView.contentSize = CGSize(width: myScrollView.frame.width, height: positionY + 10)
    }
    
    /*
        The range is 0.0 - 1.0 for screen brightness.
     
        The idea here is that if the screen dims automatically because the user is in a dark environment, we can assume
        that we could change the theme being used (to come soon). i.e. Dark mode. I do not have a good handle on the value yet though.
     
        This does work if I stick my iPhone in a drawer or am in a dark room. The change takes time to happen.
    */
    @objc func brightnessChanged() {
        let brightness:CGFloat = UIScreen.main.brightness
        print(brightness)
        if brightness < 0.35
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
            currentTheme = "dark"
        } else {
            theme = LightTheme()
            currentTheme = "light"
        }
        theme.apply(for: UIApplication.shared)
        // Can apply custom stuff here for themes elements too.
    }
    
    @objc func buttonReleased(sender: BoseButton) {
        print("release.")
    }
}
