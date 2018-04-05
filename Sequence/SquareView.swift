//
//  SquareView.swift
//  Sequence
//
//  Created by Bimonaretga on 4/4/18.
//  Copyright © 2018 moeCodes. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
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
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 8

        addSubview(textLabel)
        textLabel.font = UIFont(name: textLabel.font.fontName, size: 14)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        
    }
    
    func initTextAndTextSize(text: String, size: CGSize) {
        textLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 0), size: .init(width: size.width, height: size.height))
        textLabel.text = text
        textLabel.frame.size = size
    }
    
    func changeViewSize(size: CGSize) {
        frame.size = size
    }

}
