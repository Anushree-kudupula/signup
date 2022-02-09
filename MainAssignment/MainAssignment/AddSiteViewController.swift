//
//  AddSiteViewController.swift
//  MainAssignment
//
//  Created by Anushree on 04/02/22.
//

import UIKit

protocol PassAddSite {
    func passNewsite(newSite: DetailsOfSites)
}

class AddSiteViewController: UIViewController {
    
    var addProtocolVar: PassAddSite?
    var listOfSectors = ["Social Media", "Bank", "Others"]
    
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var siteName: UILabel!
    @IBOutlet weak var siteNameText: UITextField!
    @IBOutlet weak var sector: UILabel!
    @IBOutlet weak var sectorText: UITextField!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var notes: UILabel!
    @IBOutlet weak var notesText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Site"
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction func notesButtonTap(_ sender: Any) {
    }
    
    @IBAction func eyeButtonTap(_ sender: Any) {
        passwordText.isSecureTextEntry.toggle()
    }
    
    @IBAction func resetTap(_ sender: Any) {
        urlText.text = ""
        siteNameText.text = ""
        sectorText.text = ""
        usernameText.text = ""
        passwordText.text = ""
        notesText.text = ""
    }
    
    @IBAction func saveTap(_ sender: Any) {

        guard let newSiteName = siteNameText.text, siteNameText.hasText else {
            print("Please enter the new site name!!!")
            return
        }
        guard let newsUserName = usernameText.text, usernameText.hasText else {
            print("Please enter the username!!!")
            return
        }
        guard let newSitePassword = passwordText.text, passwordText.hasText else {
            print("Please enter the password!!!")
            return
        }
        let newSiteImg = #imageLiteral(resourceName: "default.png")
        let newSite = DetailsOfSites(image: newSiteImg, name: newSiteName, siteurl: urlText.text ?? "", sector: sectorText.text ?? "", userName: newsUserName, password: newSitePassword, notes: notesText.text ?? "")
        addProtocolVar?.passNewsite(newSite: newSite)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dropdownTap(_ sender: Any) {
        pickerView.isHidden = false
    }
}

extension AddSiteViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfSectors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return listOfSectors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.sectorText.text = self.listOfSectors[row]
        self.pickerView.isHidden = true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == self.sectorText {
            self.pickerView.isHidden = false
            textField.endEditing(true)
        }
    }
}
