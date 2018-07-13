//
//  ViewController.swift
//  ChildNavController
//
//  Created by Алексей Яцевич on 7/13/18.
//  Copyright © 2018 Алексей Яцевич. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Push", style: .plain, target: self, action: #selector(handlePush))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func handlePush() {
        let vc = ViewController()
        vc.view.backgroundColor = .brown
        navigationController?.pushViewController(vc, animated: true)
    }


}

