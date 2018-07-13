//
//  ChildViewController.swift
//  ChildNavController
//
//  Created by Алексей Яцевич on 7/13/18.
//  Copyright © 2018 Алексей Яцевич. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    var xConstraint: NSLayoutConstraint!
    var yConstraint: NSLayoutConstraint!
    
    
    lazy var childView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        cv.addGestureRecognizer(panRecognizer)
        cv.backgroundColor = .green
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = childView
    }
    
    override func didMove(toParent parent: UIViewController?) {
        print("--- CHILD: Did Move To Parent")
        guard let parent = parent else {return}
        childView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        childView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        xConstraint = childView.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor, constant: 40)
        xConstraint.isActive = true
        yConstraint = childView.topAnchor.constraint(equalTo: parent.view.topAnchor, constant: parent.view.frame.height * 2 / 3)
        yConstraint.isActive = true
        
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        guard let parent = parent else {return}
        let translation = recognizer.translation(in: parent.view)
        
        switch recognizer.state {
        case .changed:
            xConstraint.constant += translation.x
            yConstraint.constant += translation.y
            recognizer.setTranslation(CGPoint.zero, in: parent.view)
        default:
            break
        }
    }
    
    
}
