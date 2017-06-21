//
//  MainViewController.swift
//  UnitTestDemo
//
//  Created by Vivek Shah on 6/20/17.
//  Copyright © 2017 Vivek Shah. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var btnWidth: NSLayoutConstraint!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var imgProcessing: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftView : UIView = UIView.init(frame: CGRect.init(x: 10, y: 0, width: 7, height: 45))
        let leftView2 : UIView = UIView.init(frame: CGRect.init(x: 10, y: 0, width: 7, height: 45))
        txtUsername.leftView = leftView
        txtUsername.leftViewMode = .always
        txtPassword.leftView = leftView2
        txtPassword.leftViewMode = .always
        
        
        let loadingImgs : NSMutableArray = NSMutableArray.init()
        for i in 1...20 {
            loadingImgs.add(UIImage.init(named: "Processing\(i)")!)
        }
        
        self.imgProcessing.animationImages = loadingImgs as? [UIImage]
        self.imgProcessing.animationDuration = TimeInterval(loadingImgs.count / 20)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.btnWidth.constant =  UIScreen.main.bounds.size.width - 70
        self.view.setNeedsUpdateConstraints()
        self.view.layoutIfNeeded()
        self.txtUsername.text = ""
        self.txtPassword.text = ""
        self.btnLogin.setTitle("Login", for: .normal)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.imgProcessing.isHidden = true
        self.imgProcessing.stopAnimating()
        
    }
    // MARK: - Button Tap Events
    
    @IBAction func didTapSubmit(_ sender: Any) {
        self.view.endEditing(true)
        
        let retrunStr : String = self.checkLogin(user: txtUsername.text!, pass: txtPassword.text!)
        if retrunStr.characters.count > 0 {
            showErrorAlertWithMessage(retrunStr)
            return;
        }
        self.btnWidth.constant = 45
        self.btnLogin.setTitle("", for: .normal)
        self.view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
            
        }) { (Bool) in
            self.imgProcessing.isHidden = false
            self.imgProcessing.startAnimating()
            self.perform(#selector(self.navigateToHome), with: nil, afterDelay: 3.0)
        }
    }
    
    // MARK: - Static Methods
    
    func checkIfNumberEven(num: Int) -> Bool{
        return (num%2 == 0)
    }
    
    func navigateToHome(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func sumOfEvenNumbersInFibonacci(limit: Int) ->Int {
        var sum = 0
        var num1 = 1
        var num2 = 1
        while num2 <= limit {
            if num2 % 2 == 0{
                sum += num2
            }
            let newNum = num1 + num2
            num1 = num2
            num2 = newNum
        }
        return sum
    }
    
    func checkLogin(user : String, pass : String) -> String{
        if user.characters.count == 0 {
            return "Username cannot be empty"
        }
        if pass.characters.count == 0 {
            return "Password cannot be empty"
        }
//                if user == "username" || pass == "password"  { // test case failed here
        if user == "username" && pass == "password"  {
            return "" // for successful login , no error
        }
        return "Username and password doesn't match"
    }
    
    
}
