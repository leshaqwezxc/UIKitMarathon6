//
//  ViewController.swift
//  UIKitMarathon6
//
//  Created by alexeituszowski on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let rectView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 80, height: 80)))
        view.backgroundColor = .tintColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)
    var snap: UISnapBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rectView)
        
        rectView.center = view.center
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func tap(_ tapGesture: UITapGestureRecognizer) {
        let location = tapGesture.location(in: view)
        if let snap {
            dynamicAnimator.removeBehavior(snap)
        }

        let snap = UISnapBehavior(item: rectView, snapTo: location)
        snap.damping = 1
        dynamicAnimator.addBehavior(snap)
        
        self.snap = snap
    }
}

