//
//  SitesTableViewCell.swift
//  MainAssignment
//
//  Created by Anushree on 03/02/22.
//

import UIKit

class SitesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var siteImageOutlet: UIImageView!
    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var siteLinkLabel: UILabel!
    
    func setSite(title: DetailsOfSites) {
        siteImageOutlet.image = title.image
        siteLabel.text = title.name
        siteLinkLabel.text = title.siteurl
    }
    
    @IBAction func copyPasswordTap(_ sender: Any) {
    }
}
