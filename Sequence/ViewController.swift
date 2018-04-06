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

enum TutorialSequence {
    case first
    case second
    case third
    case fourth
    case fifth
}


class ViewController: UIViewController {
    
    private lazy var firstView = SquareView()
    private lazy var secondView = SquareView()
    private lazy var thirdView = SquareView()
    private lazy var fourthView = SquareView()
    private lazy var nextButton = UIView()
    private lazy var tutorialSequence = TutorialSequence.first
    let button = UIButton()
    
    private lazy var redView = UIView()
    private lazy var redText = UILabel()
    private lazy var blueView = UIView()
    private lazy var  blackView = SquareView()
    private lazy var whiteView = BubbleView()

    private lazy var viewSequence = ViewSequence.red

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        [firstView, secondView, thirdView, fourthView, button, nextButton].forEach { view.addSubview($0) }
        
        setupNumberViews()
        setupNextView()
        setupButton()
        
    }

    func setupButton() {
        button.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 20), size: .init(width: 100, height: 32))
        button.setTitle("next", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonFunctionality), for: .touchUpInside)
    }
    
    func setupNextView() {
        nextButton.anchor(top: nil, leading: view.trailingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 16, right: 0), size: .init(width: 50, height: 50))
        nextButton.backgroundColor = .green
        nextButton.layer.cornerRadius = 25
    }
    
    func setupNumberViews() {
        
        
        //firstView Setup
        firstView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        firstView.initTextAndTextSize(text: "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photo", size: .init(width: 200, height: 60))
        
        //secondView Setup
        secondView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 100, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        secondView.initTextAndTextSize(text: "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photo", size: .init(width: 200, height: 60))
        
        //thirdView Setup
        thirdView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 200, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        thirdView.initTextAndTextSize(text: "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photo", size: .init(width: 200, height: 60))
        
        //fourthView Setup
        fourthView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 300, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        fourthView.initTextAndTextSize(text: "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photo", size: .init(width: 200, height: 60))
        
        
    }
    

    
    @objc func buttonFunctionality() {
        
        switch tutorialSequence {
        case .first:
            print("first view!")
            expandFirstView()
            tutorialSequence = .second
        case .second:
            contractView(view: firstView, nextView: expandSecondView(_:))
            tutorialSequence = .third
            print("second View!")
        case .third:
            contractView(view: secondView, nextView: expandThirdView(_:))
            tutorialSequence = .fourth
            print("Third View!")
        case .fourth:
            contractView(view: thirdView, nextView: expandFourthView(_:))
            print("Fourth View")
            tutorialSequence = .fifth
        case .fifth:
            contractView(view: fourthView, nextView: finish(_:))
            animateButtonDown(nextAnimation: animateNextIn(_:))
            print("Bye")
            
        }
    }
    
    
//        switch viewSequence {
//        case .red:
//            decreaseWhiteViewSize()
//            print("Red button, Appear!")
//            increaseRedViewSize()
//            viewSequence = .blue
//        case .blue:
//            print("blue button, Appear!")
//            decreaseRedViewSize {_ in
//                self.increaseBlueViewSize()
//            }
//            viewSequence = .black
//        case .black:
//            decreaseBlueViewSize(handler: { boolean in
//                print(boolean)
//                self.increaseBlackViewSize()
//            })
//            print("black button, Appear!")
//            viewSequence = .over
//
//        case .custom:
//            increaseWhiteViewSize()
//            print("do custom stuff")
//            viewSequence = .red
//
//        case .over:
//            decreaseBlackViewSize(handler: { boolean in
//                print("it's over!")
//                self.viewSequence = .custom
//            })
//        }
    
        
//    }
    
    
    
    func expandFirstView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("firstViewAnimationTriggered!")
            self.firstView.changeViewSize(size: .init(width: 240, height: 80))
        }, completion: nil)
    }
    
    func expandSecondView(_: Bool)->Void {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("secondViewAnimationTriggered!")
            self.secondView.changeViewSize(size: .init(width: 240, height: 80))
        }, completion: nil)
    }
    
    func expandThirdView(_: Bool)->Void {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("thirdViewAnimationTriggered!")
            self.thirdView.changeViewSize(size: .init(width: 240, height: 80))
        }, completion: nil)
    }
    
    func expandFourthView(_: Bool)->Void {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("fourthViewAnimationTriggered!")
            self.fourthView.changeViewSize(size: .init(width: 240, height: 80))
        }, completion: nil)
    }
    
    
    func contractView(view: SquareView, nextView: @escaping (Bool)->()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("firstViewAnimationTriggered!")
            view.changeViewSize(size: .init(width: 0, height: 0))
        }, completion: nextView)
    }
    
    func animateButtonDown(nextAnimation: @escaping (Bool)->()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("Bye Button")
            self.button.frame.origin.y = (self.button.frame.origin.y + 100.0)
        }, completion: nextAnimation)
    }
    
    func animateNextIn(_: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
            print("finishe!!")
            self.nextButton.frame.origin.x = (self.nextButton.frame.origin.x - 100)
        }, completion: nil)
    }
    
    
    func finish(_: Bool) {
        print("animation finished")
    }
    
}
    
    
//    func increaseRedViewSize() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
//            print("red animation triggered!")
//            self.redView.frame.size.width = 256
//            self.redView.frame.size.height = 140
//        }, completion: nil)
//    }
//
//    func decreaseRedViewSize(handler: @escaping (Bool)->() ) {
//        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
//            print("red animation triggered!")
//            self.redView.frame.size.width = 0
//            self.redView.frame.size.height = 0
//        }, completion: handler)
//
//    }
//
//    func increaseBlueViewSize() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
//            print("blue animation triggered!")
//            //self.blueView.layer.opacity = 1
//            self.blueView.frame.size.width = 200
//            self.blueView.frame.size.height = 200
//        }, completion: nil)
//    }
//
//    func decreaseBlueViewSize(handler: @escaping (Bool)->()) {
//        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
//            self.blueView.frame.size.width = 0
//            self.blueView.frame.size.height = 0
//        }, completion: handler)
//    }
//
//    func increaseBlackViewSize() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
//            self.blackView.changeViewSize(size: .init(width: 260, height: 80))
//        }, completion: nil)
//    }
//
//    func decreaseBlackViewSize(handler: @escaping (Bool)->()) {
//        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10.0, options: [], animations: {
//            self.blackView.frame.size.width = 0
//            self.blackView.frame.size.height = 0
//        }, completion: handler)
//    }
//
//    func increaseWhiteViewSize() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
//            self.whiteView.resize(width: 300, height: 100)
//        }, completion: whiteView.textReload)
//    }
//
//    func decreaseWhiteViewSize() {
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options: [], animations: {
//            self.whiteView.changeText(text: "AAAAAAA", width: 280)
//            self.whiteView.resize(width: 0, height: 0)
//        }, completion: nil)
//    }

    //    func setupViews() {
    //
    //        view.backgroundColor = .gray
    //        //adding all views to parentView
    //        [redView, blueView, blackView, whiteView, button].forEach { view.addSubview($0) }
    //
    //        //redView setup
    //        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 32, left: 32, bottom: 0, right: 0) , size: .init(width: 0, height: 0))
    //        redView.backgroundColor = .white
    //        redView.addSubview(redText)
    //        redView.clipsToBounds = true
    //        redText.text = "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photo"
    //        redText.font = UIFont(name: redText.font.fontName, size: 14)
    //        redText.anchor(top: redView.topAnchor, leading: redView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 240, height: 80)  )
    //        redView.layer.cornerRadius = 8
    //        redText.lineBreakMode = .byWordWrapping
    //        redText.numberOfLines = 8
    //
    //
    //        //blueView setup
    //        blueView.anchor(top: redView.bottomAnchor , leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 200, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
    //        blueView.backgroundColor = .blue
    //
    //        //blackview setup
    //        blackView.anchor(top: blueView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding:  .init(top: 200, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
    //        blackView.initTextAndTextSize(text: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum Lorem Ipsum", size: .init(width: 240, height: 60))
    //
    //        //whiteView setup
    //        whiteView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 300, left: 32, bottom: 0, right: 0), size: .init(width: 0, height: 0))
    //        whiteView.changeText(text: "You can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photoYou can customize the outting photo by swiping through. Or add your own photo by using the add button on the corner of this photoYou can customize the outting photo by swiping through.", width: 280)
    //
    //        //button setup
    //        button.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 20), size: .init(width: 100, height: 32))
    //        button.setTitle("next", for: .normal)
    //        button.backgroundColor = .green
    //        button.layer.cornerRadius = 4
    //        button.addTarget(self, action: #selector(buttonFunctionality), for: .touchUpInside)
    //
    //    }


