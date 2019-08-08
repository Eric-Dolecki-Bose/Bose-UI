//
//  BoseButton.swift
//  Bose UI
//
//  Created by Eric Dolecki on 7/29/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

enum Type {
    case Dark, Light, Primary, PrimaryDestructive, Secondary, SecondaryDestructive, Facebook, Amazon
}

class BoseButton: UIButton {

    var myType: Type = .Dark
    let lightGrey = UIColor(hex: "#edededff")
    
    // The height is controlled by the Class. Just supply the width.
    // Position it after creating it by using origin x and/or y or center.
    init(width: CGFloat, title: String, type: Type)
    {
        let frame = CGRect(x: 0, y: 0, width: width, height: 40)
        super.init(frame: frame)
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = true
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "GothamSSm-Bold", size: 13.0)
        myType = type
        conditionUI()
    }
    
    func conditionUI()
    {
        if myType == .Dark {
            self.setTitleColor(UIColor.white, for: .normal)
            self.backgroundColor = UIColor.black
        } else if myType == .Light || myType == .Secondary {
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = UIColor(hex: "#edededff")
        } else if myType == .Primary {
            self.setTitleColor(UIColor.white, for: .normal)
            self.backgroundColor = UIColor.black
        } else if myType == .PrimaryDestructive {
            self.setTitleColor(UIColor.white, for: .normal)
            self.backgroundColor = UIColor(hex: "#b51a0eff")
        } else if myType == .SecondaryDestructive {
            self.setTitleColor(UIColor(hex: "#b51a0eff"), for: .normal)
            self.backgroundColor = UIColor(hex: "#edededff")
        } else if myType == .Facebook {
            self.setTitleColor(UIColor.white, for: .normal)
            self.backgroundColor = UIColor(hex: "#3b5998ff")
            self.setImage(UIImage(named: "fb"), for: .normal)
        } else if myType == .Amazon {
            self.setTitleColor(UIColor.black, for: .normal)
            self.backgroundColor = UIColor(hex: "#FF9900ff")
            self.setImage(UIImage(named: "amazon"), for: .normal)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: (bounds.width - 45))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
    
    override open var isHighlighted: Bool
    {
        didSet {
            
            // Scaling on press and release.
            if isHighlighted {
                UIView.animate(withDuration: 0.2) {
                    self.transform = CGAffineTransform(scaleX: 0.98,y: 0.98)
                }
            } else {
                UIView.animate(withDuration: 0.4) {
                    self.transform = CGAffineTransform.identity
                }
            }
            
            if myType == .Dark {
                
                backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.black
                
            } else if myType == .Light || myType == .Secondary {
                
                backgroundColor = isHighlighted ? lightGrey : UIColor(hex: "#edededff")
                if isHighlighted {
                    setTitleColor(UIColor.darkGray, for: .normal)
                } else {
                    setTitleColor(UIColor.black, for: .normal)
                }
                
            } else if myType == .Primary {
                
                backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.black
                
            } else if myType == .PrimaryDestructive {
                
                backgroundColor = isHighlighted ? UIColor(hex: "#b51a0eff")?.withAlphaComponent(0.7) : UIColor(hex: "#b51a0eff")
                
            } else if myType == .SecondaryDestructive {
                
                if isHighlighted {
                    setTitleColor(UIColor(hex: "#b51a0eff")?.withAlphaComponent(0.7), for: .normal)
                } else {
                    setTitleColor(UIColor(hex: "#b51a0eff"), for: .normal)
                }
                
            } else if myType == .Facebook {
                
                backgroundColor = isHighlighted ? UIColor(hex: "#4a70c2ff") : UIColor(hex: "#3b5998ff")
                if isHighlighted {
                    setTitleColor(UIColor(hex: "#DDDDDDff"), for: .highlighted)
                } else {
                    setTitleColor(UIColor.white, for: .normal)
                }
                let tintedImage = imageView?.image?.withRenderingMode(.alwaysTemplate)
                self.setImage(tintedImage, for: .highlighted)
                self.tintColor = .white
                
            } else if myType == .Amazon {
                
                backgroundColor = isHighlighted ? UIColor(hex: "#fab650ff") : UIColor(hex: "#FF9900ff")
                if isHighlighted {
                    setTitleColor(UIColor(hex: "#555555ff"), for: .highlighted)
                } else {
                    setTitleColor(UIColor.black, for: .normal)
                }
                let tintedImage = imageView?.image?.withRenderingMode(.alwaysTemplate)
                self.setImage(tintedImage, for: .highlighted)
                self.tintColor = .black
            }
        }
    }
    
    // MARK: - Enable Closure
    
    func add (for controlEvents: UIControl.Event, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(ObjectIdentifier(self).hashValue) + String(controlEvents.rawValue), sleeve,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    /*
     let button = UIButton()
     button.actionHandle(controlEvents: UIControlEvents.TouchUpInside,
     ForAction:{() -> Void in
     print("Touch")
     })
     */
    
    
    // MARK: -
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}
