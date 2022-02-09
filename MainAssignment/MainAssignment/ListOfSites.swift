//
//  ListOfSites.swift
//  MainAssignment
//
//  Created by Anushree on 03/02/22.
//

import Foundation
import UIKit

class ListOfSites {
    
    var sites: [DetailsOfSites] = [DetailsOfSites]()
    var newTofilter: [DetailsOfSites] = [DetailsOfSites]()
    
    init() {
        self.createSites()
    }
    
    func createSites() {
        sites.append(DetailsOfSites(image: #imageLiteral(resourceName: "Bitmap.png"), name: "Facebook", siteurl: "www.facebook.com", sector: "Social Media", userName: "facebook", password: "1234abc", notes: ""))
        sites.append(DetailsOfSites(image: #imageLiteral(resourceName: "Bitmap-3.png"), name: "Youtube", siteurl: "www.youtube.com", sector: "Social Media", userName: "Utube", password: "1234edf", notes: ""))
        sites.append(DetailsOfSites(image: #imageLiteral(resourceName: "Bitmap Copy 2.png"), name: "Twitter", siteurl: "www.twitter.com", sector: "Social Media", userName: "twitter", password: "1234hij", notes: ""))
        sites.append(DetailsOfSites(image: #imageLiteral(resourceName: "Bitmap-2.png"), name: "Instagram", siteurl: "www.instagram.com", sector: "Social Media", userName: "insta", password: "1234qwe", notes: ""))
        sites.append(DetailsOfSites(image: #imageLiteral(resourceName: "pinterest.png"), name: "Pinterest", siteurl: "www.pinterest.com", sector: "Social Media", userName: "pinterest", password: "1234poi", notes: ""))
        newTofilter = sites
    }
    
//    func getNames() {
//        for eachSite in sites {
//        siteName.append(eachSite.name)
//        }
//    }
    
    var getCount: Int {
        get {
            sites.count
        }
    }
    
    func siteAt(index: Int) -> DetailsOfSites? {
    
        if(index < 0 || index > sites.count) {
            return nil
        }
        return sites[index]
    }
    
    func appendAt(newSite: DetailsOfSites) {
        sites.append(newSite)
    }
}
