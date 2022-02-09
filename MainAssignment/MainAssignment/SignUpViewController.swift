//
//  SihnUpViewController.swift
//  MainAssignment
//
//  Created by Anushree on 03/02/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var enterNo: UITextField!
    @IBOutlet weak var enterpin: UITextField!
    @IBOutlet weak var reenterpin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpTap(_ sender: Any) {
        self.showToast(message: "Registration successfull:) Sign-in to continue", font: .systemFont(ofSize: 20))
    }
}
