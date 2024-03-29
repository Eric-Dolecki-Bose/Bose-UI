//
//  BoseInstructionPanel.swift
//  Bose UI
//
//  Created by Eric Dolecki on 8/1/19.
//  Copyright © 2019 Eric Dolecki. All rights reserved.
//

import UIKit

class BoseInstructionPanel: UIView {

    public var myTitle: String!
    public var myMessage: String!
    public var myTitleLabel: UILabel!
    public var myMessageView: UITextView!
    private var myMask: UIView!
    
    init(width: CGFloat, title: String, message: String) {
        let frame = CGRect(x: 0, y: 0, width: width, height: 250)
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.FlatColor.Gray.WhiteSmoke.cgColor
        self.layer.borderWidth = 1.0
        myTitle = title
        myMessage = message
        generateUI()
    }
    
    private func generateUI()
    {
        myMask = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        myMask.backgroundColor = UIColor.blue
        myMask.layer.cornerRadius = 200
        myMask.center = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.mask = myMask
        
        myTitleLabel = UILabel(frame: CGRect(x: 30, y: 45, width: self.frame.width - 20, height: 20))
        myTitleLabel.font = UIFont(name: "GothamSSm-Bold", size: 16.0)
        myTitleLabel.textColor = UIColor.black
        myTitleLabel.text = myTitle
        
        myMessageView = UITextView(frame: CGRect(x: 30, y: 80, width: self.frame.width - 50, height: self.frame.height - 115))
        myMessageView.autocapitalizationType = .none
        myMessageView.isEditable = false
        myMessageView.isSelectable = false
        myMessageView.textColor = UIColor.black
        myMessageView.textContainer.lineFragmentPadding = 0 //No inset on the left.
        myMessageView.textContainerInset = .zero // Right to the top of the container.
        
        // Let's get some line height spacing here.
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.paragraphStyle: style,
                          NSAttributedString.Key.font: UIFont(name: "GothamSSm-Book", size: 12.5)!,
                          NSAttributedString.Key.kern: -0.25 ] as [NSAttributedString.Key : Any]
        
        myMessageView.attributedText = NSAttributedString(string: myMessage, attributes: attributes as [NSAttributedString.Key : Any])
        
        self.addSubview(myTitleLabel)
        self.addSubview(myMessageView)
    }
    
    // Destroy me when I'm not needed any longer.
    public func remove(withAnimation: Bool = false, timing: TimeInterval = 0.5) {
        if withAnimation == true {
            
            UIView.animate(withDuration: timing, animations: {
                self.myMask.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }) { (success) in
                self.removeFromSuperview()
            }
            
        } else {
            self.removeFromSuperview()
        }
    }
    
    public func remove() {
        self.removeFromSuperview()
    }
    
    public func updatePanel(title: String) {
        myTitle = title
        myTitleLabel.text = myTitle
    }
    
    public func updatePanel(message: String) {
        myMessage = message
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.paragraphStyle: style,
                          NSAttributedString.Key.font: UIFont(name: "GothamSSm-Book", size: 12.5)!,
                          NSAttributedString.Key.kern: -0.25 ] as [NSAttributedString.Key : Any]
        myMessageView.attributedText = NSAttributedString(string: myMessage, attributes: attributes as [NSAttributedString.Key : Any])
    }
    
    public func updatePanel(title: String, message: String) {
        myTitle = title
        myTitleLabel.text = myTitle
        myMessage = message
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSAttributedString.Key.paragraphStyle: style,
                          NSAttributedString.Key.font: UIFont(name: "GothamSSm-Book", size: 12.5)!,
                          NSAttributedString.Key.kern: -0.25 ] as [NSAttributedString.Key : Any]
        myMessageView.attributedText = NSAttributedString(string: myMessage, attributes: attributes as [NSAttributedString.Key : Any])
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
