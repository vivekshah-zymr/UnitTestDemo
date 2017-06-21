//
//  UIStoryboard+Extensions.swift
//  XCTestDemo
//
//  Created by Vivek Shah on 6/7/17.
//  Copyright © 2017 Vivek Shah. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlertWithMessage(_ message: String) {
        let alertController = UIAlertController(title: "Alert", message:message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
