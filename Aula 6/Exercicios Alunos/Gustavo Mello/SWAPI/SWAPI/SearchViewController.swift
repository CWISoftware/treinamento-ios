//
//  SearchViewController.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mostAccessed: UIView!
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var noData: UIImageView!
    @IBOutlet weak var tablePeople: UITableView!
    
    var peoples: [People] = []
    let grayDefault = "E6E6E6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tablePeople.backgroundColor = UIColor.init(hexString: self.grayDefault)
        self.peoples = [People]()
        
        PeopleService.findAll() { (peoples, i) in
            self.peoples = peoples!
            self.tablePeople.reloadData()
        }
    }
    
    @IBAction func txtSearch(_ sender: UITextField) {
        PeopleService.findByName(sender.text!) { (peoples, i) in
            if peoples != nil {
                self.peoples = peoples!
                self.noDataInformationControll(isHidden: true)
            } else {
                self.peoples = []
                self.noDataInformationControll(isHidden: false)
            }
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
        cell.backgroundColor = UIColor.init(hexString: self.grayDefault)
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.init(hexString: self.grayDefault)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.init(hexString: self.grayDefault)
    }

    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PeopleDetailController") as! PeopleDetailController
        vc.idPeople = self.peoples[indexPath.item].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func noDataInformationControll(isHidden : Bool) {
        self.noData.isHidden = isHidden
        self.noDataLabel.isHidden = isHidden
        self.mostAccessed.isHidden = !isHidden
    }
}
