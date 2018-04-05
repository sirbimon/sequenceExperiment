//
//  ViewController.swift
//  Sequence
//
//  Created by Bimonaretga on 4/2/18.
//  Copyright © 2018 moeCodes. All rights reserved.
//

import UIKit


enum ViewSequence {
    case red
    case blue
    case black
    case custom
    case over
}


class ViewController: UIViewController {
    
    private lazy var redView = UIView()
    private lazy var redText = UILabel()
    private lazy var blueView = UIView()
    private lazy var  blackView = SquareView()
    private lazy var whiteView = BubbleView()
    let button = UIButton()
    private lazy var viewSequence = ViewSequence.red

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        
        view.backgroundColor = .gray
        //adding all views to parentView
        [redView, blueView, blackView, whiteView, button].forEach { view.addSubview($0) }
        
        //redView setup
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 32, left: 32, bottom: 0, right: 0) , size: .init(width: 0, height: 0))
        redView.backgroundColor = .white
        redView.addSubview(redText)
        redView.clipsToBounds = true
        redText.text = "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photo"
        redText.font = UIFont(name: redText.font.fontName, size: 14)
        redText.anchor(top: redView.topAnchor, leading: redView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 240, height: 80)  )
        redView.layer.cornerRadius = 8
        redText.lineBreakMode = .byWordWrapping
        redText.numberOfLines = 8
        
        
        //blueView setup
        blueView.anchor(top: redView.bottomAnchor , leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 200, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        blueView.backgroundColor = .blue
        
        //blackview setup
        blackView.anchor(top: blueView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 200, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        blackView.initTextAndTextSize(text: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum Lorem Ipsum", size: .init(width: 240, height: 60))
        
        //whiteView setup
        whiteView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 300, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        whiteView.changeText(text: "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photoYou can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photoYou can customize the outting photo by swiping through.", width: 280)
        
        //button setup
        button.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 20), size: .init(width: 100, height: 32))
        button.setTitle("next", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonFunctionality), for: .touchUpInside)
        
    }
    
    @objc func buttonFunctionality() {
        switch viewSequence {
        case .red:
            decreaseWhiteViewSize()
            print("Red button, Appear!")
            increaseRedViewSize()
            viewSequence = .blue
        case .blue:
            print("blue button, Appear!")
            decreaseRedViewSize {_ in
                self.increaseBlueViewSize()
            }
            viewSequence = .black
        case .black:
            decreaseBlueViewSize(handler: { boolean in
                print(boolean)
                self.increaseBlackViewSize()
            })
            print("black button, Appear!")
            viewSequence = .over
            
        case .custom:
            increaseWhiteViewSize()
            print("do custom stuff")
            viewSequence = .red
            
        case .over:
            decreaseBlackViewSize(handler: { boolean in
                print("it's over!")
                self.viewSequence = .custom
            })
        }
        
        
    }
    
    func increaseRedViewSize() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
            print("red animation triggered!")
            self.redView.frame.size.width = 256
            self.redView.frame.size.height = 140
        }, completion: nil)
    }
    
    func decreaseRedViewSize(handler: @escaping (Bool)->() ) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
            print("red animation triggered!")
            self.redView.frame.size.width = 0
            self.redView.frame.size.height = 0
        }, completion: handler)

    }
    
    func increaseBlueViewSize() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("blue animation triggered!")
            //self.blueView.layer.opacity = 1
            self.blueView.frame.size.width = 200
            self.blueView.frame.size.height = 200
        }, completion: nil)
    }
    
    func decreaseBlueViewSize(handler: @escaping (Bool)->()) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
            self.blueView.frame.size.width = 0
            self.blueView.frame.size.height = 0
        }, completion: handler)
    }
    
    func increaseBlackViewSize() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            self.blackView.changeViewSize(size: .init(width: 260, height: 80))
        }, completion: nil)
    }
    
    func decreaseBlackViewSize(handler: @escaping (Bool)->()) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
            self.blackView.frame.size.width = 0
            self.blackView.frame.size.height = 0
        }, completion: handler)
    }
    
    func increaseWhiteViewSize() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            self.whiteView.resize(width: 300, height: 100)
        }, completion: whiteView.textReload)
    }
    
    func decreaseWhiteViewSize() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            self.whiteView.changeText(text: "AAAAAAA", width: 280)
            self.whiteView.resize(width: 0, height: 0)
        }, completion: nil)
    }


}

