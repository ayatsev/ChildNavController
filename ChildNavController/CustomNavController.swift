//
//  CustomNavController.swift
//  ChildNavController
//
//  Created by Алексей Яцевич on 7/13/18.
//  Copyright © 2018 Алексей Яцевич. All rights reserved.
//

import UIKit

class CustomNavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        let childController = ChildViewController()
        addChild(childController)
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
}

