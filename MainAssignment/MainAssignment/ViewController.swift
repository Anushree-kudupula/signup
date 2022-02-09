//
//  ViewController.swift
//  MainAssignment
//
//  Created by Anushree on 02/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var signinView: UIView!
    @IBOutlet weak var signupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupView.isHidden = true
    }
    
    @IBAction func signinTap(_ sender: Any) {
        firstView.isHidden = true
        secondView.isHidden = false
        signinView.isHidden = false
        signupView.isHidden = true
    }
    
    @IBAction func signupTap(_ sender: Any) {
        firstView.isHidden = false
        secondView.isHidden = true
        signinView.isHidden = true
        signupView.isHidden = false
    }
}

