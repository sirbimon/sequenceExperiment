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
    case over
}


class ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()
    private lazy var  blackView = UIView()
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
        //adding all views to parentView
        [redView, blueView, blackView, button].forEach { view.addSubview($0) }
        
        //redView setup
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 32, left: 32, bottom: 0, right: 0) , size: .init(width: 0, height: 0))
        redView.backgroundColor = .red
        
        //blueView setup
        blueView.anchor(top: redView.bottomAnchor , leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 200, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        blueView.backgroundColor = .blue
        
        //button setup
        button.anchor(top: nil, leading: view.centerXAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 100, bottom: 200, right: 0), size: .init(width: 100, height: 32))
        
        //blackview setup
        blackView.anchor(top: blueView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 200, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        blackView.backgroundColor = .black
        
        
        button.setTitle("next", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonFunctionality), for: .touchUpInside)
    }
    
    @objc func buttonFunctionality() {
        switch viewSequence {
        case .red:
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
        case .over:
            decreaseBlackViewSize(handler: { (_) in
                print("it's over!")
                self.viewSequence = .red
            })
        }
        
        
    }
    
    func increaseRedViewSize() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
            print("red animation triggered!")
            self.redView.frame.size.width = 200
            self.redView.frame.size.height = 200
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
            self.blackView.frame.size.width = 200
            self.blackView.frame.size.height = 200
        }, completion: nil)
    }
    
    func decreaseBlackViewSize(handler: @escaping (Bool)->()) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
            self.blackView.frame.size.width = 0
            self.blackView.frame.size.height = 0
        }, completion: handler)
    }
    
    
    
    
    func toggleRedView() {
        if redView.layer.opacity == 1 {
            redView.layer.opacity = 0
        } else {
            redView.layer.opacity = 1
        }
    }
    
    func toggleBlueView() {
        if blueView.layer.opacity == 1 {
            blueView.layer.opacity = 0
        } else {
            blueView.layer.opacity = 1
        }
    }


}

