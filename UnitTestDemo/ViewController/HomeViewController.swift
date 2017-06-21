//
//  HomeViewController.swift
//  UnitTestDemo
//
//  Created by Vivek Shah on 6/20/17.
//  Copyright © 2017 Vivek Shah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
