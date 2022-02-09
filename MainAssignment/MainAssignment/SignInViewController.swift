//
//  SignInViewController.swift
//  MainAssignment
//
//  Created by Anushree on 03/02/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var mobileNo: UITextField!
    @IBOutlet weak var mpin: UITextField!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var useFingerPrintLabel: UILabel!
    @IBOutlet weak var fingerprintImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func visiblePinTap(_ sender: Any) {
    }
    
    @IBAction func forgotPasswordTap(_ sender: Any) {
    }
    
    @IBAction func signinTap(_ sender: Any) {
        self.showToast(message: "Congrats!!! Successful login to get the vault", font: .systemFont(ofSize: 20))
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "SitesTableViewController") as! SitesTableViewController
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height - 125, width: 320, height: 66))
    toastLabel.backgroundColor = UIColor.black
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 30
    toastLabel.clipsToBounds  =  true
    toastLabel.numberOfLines = 0
    toastLabel.lineBreakMode = .byWordWrapping
    
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }


