//
//  SiteDetailsViewController.swift
//  MainAssignment
//
//  Created by Anushree on 04/02/22.
//

import UIKit

protocol PassEditedSite {
    func passEditSite (URL: String, NAME: String, SECTOR: String, USERNAME: String, PASSWORD: String, NOTES: String)
}

class SiteDetailsViewController: UIViewController {
    
    var siteRef: DetailsOfSites?
    var protocolVar: PassEditedSite?
    var editedUrl: String?
    var editedName: String?
    var editedSector: String?
    var editedUsername: String?
    var editedPassword: String?
    var editedNotes: String?
    var sectorList = ["Social Media", "Bank", "Others"]
    
    @IBOutlet weak var urlDetail: UILabel!
    @IBOutlet weak var urlDetailText: UITextField!
    @IBOutlet weak var siteDetail: UILabel!
    @IBOutlet weak var siteDetailText: UITextField!
    @IBOutlet weak var sectorDetail: UILabel!
    @IBOutlet weak var sectorDetailText: UITextField!
    @IBOutlet weak var usernameDetail: UILabel!
    @IBOutlet weak var usernameDetailText: UITextField!
    @IBOutlet weak var passwordDetail: UILabel!
    @IBOutlet weak var passwordDetailText: UITextField!
    @IBOutlet weak var notesDetail: UILabel!
    @IBOutlet weak var notesDetailText: UITextField!
    @IBOutlet weak var updateUIView: UIView!
    @IBOutlet weak var pickerWhileEdit: UIPickerView!
    @IBOutlet weak var dopdownButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlDetailText.text = siteRef?.siteurl
        siteDetailText.text = siteRef?.name
        sectorDetailText.text = siteRef?.sector
        usernameDetailText.text = siteRef?.userName
        passwordDetailText.text = siteRef?.password
        notesDetailText.text = siteRef?.notes
        updateUIView.isHidden = true
        dopdownButton.isUserInteractionEnabled = false
        navigationItem.title = "Site Detail"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEditButton))
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemTeal
        pickerWhileEdit.delegate = self
        pickerWhileEdit.dataSource = self
    }
    
    @objc func handleEditButton() {
        updateUIView.isHidden = false
        self.navigationItem.rightBarButtonItem = nil
        navigationItem.title = "Edit"
        urlDetailText.isUserInteractionEnabled = true
        siteDetailText.isUserInteractionEnabled = true
        sectorDetailText.isUserInteractionEnabled = true
        usernameDetailText.isUserInteractionEnabled = true
        passwordDetailText.isUserInteractionEnabled = true
        notesDetailText.isUserInteractionEnabled = true
        dopdownButton.isUserInteractionEnabled = true
    }
    
    @IBAction func eyeDetailTapped(_ sender: Any) {
        passwordDetailText.isSecureTextEntry.toggle()
    }
    
    @IBAction func notesDetailTap(_ sender: Any) {
    }
    
    @IBAction func updateButtonTap(_ sender: Any) {
        editedUrl = urlDetailText.text
        editedName = siteDetailText.text
        editedSector = sectorDetailText.text
        editedUsername = usernameDetailText.text
        editedPassword = passwordDetailText.text
        editedNotes = notesDetailText.text
        protocolVar?.passEditSite(URL: editedUrl ?? "", NAME: editedName ?? "", SECTOR: editedSector ?? "", USERNAME: editedUsername ?? "", PASSWORD: editedPassword ?? "", NOTES: editedNotes ?? "")
        print(editedUrl ?? "")
        //navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dropdownEdit(_ sender: Any) {
        pickerWhileEdit.isHidden = false
    }
    
}

extension SiteDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sectorList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return sectorList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.sectorDetailText.text = self.sectorList[row]
        self.pickerWhileEdit.isHidden = true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == self.sectorDetailText {
            self.pickerWhileEdit.isHidden = false
            textField.endEditing(true)
        }
    }
}

