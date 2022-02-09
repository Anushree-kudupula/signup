//
//  DetailOfSite.swift
//  MainAssignment
//
//  Created by Anushree on 03/02/22.
//

import Foundation
import UIKit

class DetailsOfSites {
    
    var image: UIImage?
    var name: String
    var siteurl: String
    var sector: String
    var userName: String
    var password: String
    var notes: String
    
    init(image: UIImage, name: String, siteurl: String, sector: String, userName: String, password: String, notes: String) {
        self.image = image
        self.name = name
        self.siteurl = siteurl
        self.sector = sector
        self.userName = userName
        self.password = password
        self.notes = notes
    }
}
