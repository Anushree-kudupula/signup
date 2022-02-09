//
//  SitesTableViewController.swift
//  MainAssignment
//
//  Created by Anushree on 03/02/22.
//

import UIKit

class SitesTableViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableviewOutlet: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var dataSync: UIView!
    @IBOutlet weak var syncImage: UIImageView!
    
    var indexPath2 = 0
    var indexTemp: IndexPath? = nil
    var allSites = ListOfSites()
    var newArr = [DetailsOfSites]()
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame:CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemBlue
        
        let floatImg = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(floatImg, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchImage = #imageLiteral(resourceName: "search.png")
        let cloudImage = #imageLiteral(resourceName: "sync_icn.png")
        let profileImage = #imageLiteral(resourceName: "profile.png")
        
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector (didTapSearchButton))
        let cloudButton = UIBarButtonItem(image: cloudImage, style: .plain, target: self, action: #selector (didTapCloudButton))
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector (didTapProfileButton))
        
        let menuImage = #imageLiteral(resourceName: "burger_menu.png")
        let menuButton = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector (didTapMenuButton))
        
        navigationItem.title = "Pass Manager"
        navigationItem.leftBarButtonItems = [menuButton]
        navigationItem.rightBarButtonItems = [searchButton, cloudButton, profileButton]
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemTeal
        definesPresentationContext = true
        tableviewOutlet.delegate = self
        tableviewOutlet.dataSource = self
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapAddSite), for: .touchUpInside)
        searchBar.isHidden = true
        searchBar.delegate = self
        dataSync.isHidden = true
    }
    
    @objc func didTapSearchButton() {
        searchBar.isHidden = false
    }
    
    @objc func didTapCloudButton() {
        dataSync.alpha = 0.9
        dataSync.isHidden = false
        
    }
    
    @objc func didTapProfileButton() {
        
    }
    
    @objc func didTapMenuButton() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 70, y: view.frame.size.height - 100, width: 60, height: 60)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let indexTemp1 = indexTemp {
            tableviewOutlet.reloadRows(at: [indexTemp1], with: .fade)
        }
    }
    
    @objc private func didTapAddSite() {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AddSiteViewController") as! AddSiteViewController
        newVC.addProtocolVar = self
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text: String = self.searchBar.text ?? ""
        self.allSites.sites = []
        for item in allSites.newTofilter {
            if (item.name.lowercased().contains(text.lowercased())) {
                    self.allSites.sites.append(item)
                }
            }
            if (text.isEmpty) {
                self.allSites.sites = allSites.newTofilter
            }
        self.tableviewOutlet.reloadData()
    }
}

extension SitesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSites.getCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SitesTableViewCell") as! SitesTableViewCell
        if let eachSite = allSites.siteAt(index: indexPath.row) {
            cell.setSite(title: eachSite)
            return cell
        }
        return SitesTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath2 = indexPath.row
        indexTemp = indexPath
        let vc = storyboard?.instantiateViewController(withIdentifier: "SiteDetailsViewController") as! SiteDetailsViewController
        vc.siteRef = allSites.siteAt(index: indexPath.row)
        vc.protocolVar = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension SitesTableViewController: PassEditedSite {
    func passEditSite(URL: String, NAME: String, SECTOR: String, USERNAME: String, PASSWORD: String, NOTES: String) {
        self.allSites.sites[indexPath2].siteurl = URL
        self.allSites.sites[indexPath2].name = NAME
        self.allSites.sites[indexPath2].sector = SECTOR
        self.allSites.sites[indexPath2].userName = USERNAME
        self.allSites.sites[indexPath2].password = PASSWORD
        self.allSites.sites[indexPath2].notes = NOTES
    }
}

extension SitesTableViewController: PassAddSite {
    func passNewsite(newSite: DetailsOfSites) {
        allSites.appendAt(newSite: newSite)
        tableviewOutlet.reloadData()
        self.showToast(message: "Saved successfully....", font: .systemFont(ofSize: 20))
    }
}
