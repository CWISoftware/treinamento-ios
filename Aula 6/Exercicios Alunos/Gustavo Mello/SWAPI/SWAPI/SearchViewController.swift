//
//  SearchViewController.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablePeople: UITableView!
    
    var peoples: [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tablePeople.backgroundColor = UIColor.init(hexString: "E6E6E6")
        self.peoples = [People]()
        
        PeopleService.findAll() { (peoples, i) in
            self.peoples = peoples!
            self.tablePeople.reloadData()
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: DATA SOURCE METHODS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PeopleUITableViewCell.instanceNib) as! PeopleUITableViewCell
        
        cell.config(name: self.peoples[indexPath.item].name)
        cell.backgroundColor = UIColor.init(hexString: "E6E6E6")
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PeopleDetailController") as! PeopleDetailController
        vc.idPeople = self.peoples[indexPath.item].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
