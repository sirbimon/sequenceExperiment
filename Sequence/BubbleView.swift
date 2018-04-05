//
//  BubbleView.swift
//  Sequence
//
//  Created by Bimonaretga on 4/3/18.
//  Copyright © 2018 moeCodes. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    
    private lazy var textLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .white
        self.addSubview(textLabel)
        textLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: .init(width: 20, height: 40))
        print(textLabel.frame.size.width)
        textLabel.numberOfLines = 0
        textLabel.font = UIFont(name: textLabel.font.fontName, size: 14)
        //textLabel.backgroundColor = .orange
        //textLabel.sizeToFit()
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        
    }
    
    func resize(width: CGFloat, height: CGFloat) {
        frame.size.width = width
        frame.size.height = height
    }
    
    func textReload(_: Bool) -> () {
        textLabel.sizeToFit()
    }
    
    func changeText(text: String, width: CGFloat) {
        textLabel.text = text
        textLabel.frame.size.width = width
    }
    
}
