//
//  PeopleViewController.swift
//  Aula6
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

enum typeViewEnum: Int {
    case people = 1
    case starship = 2
    case film = 3
    case planet = 4
}

class DataViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var textSearch: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var dataTableView:UITableView!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var viewNoDataFound: UIView!
    @IBOutlet weak var textSearchInput: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avaterImage: UIImageView!
    
    var typeView: typeViewEnum = typeViewEnum.people
    var data: [Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewSearch.layer.cornerRadius = 3
        self.loader.startAnimating()
        self.viewNoDataFound.isHidden = true
        
        switch typeView {
        case typeViewEnum.people:
            self.titleLabel.text = "People"
            self.textSearchInput.placeholder = "Search for people"
            break
        case typeViewEnum.starship:
            self.titleLabel.text = "Starships"
            self.textSearchInput.placeholder = "Search for starships"
            break
        case typeViewEnum.film:
            self.titleLabel.text = "Films"
            self.textSearchInput.placeholder = "Search for films"
            break
        case typeViewEnum.planet:
            self.titleLabel.text = "Planets"
            self.textSearchInput.placeholder = "Search for planets"
            break
        
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
    }
    
    /// Action that return to ViewController
    @IBAction func returnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func fakeSearchButtonAction(_ sender: Any) {
        let newPosition = self.textSearch.endOfDocument
        self.textSearch.selectedTextRange = self.textSearch.textRange(from: newPosition, to: newPosition)
    }
    
    @IBAction func textSearchEditingChanged(_ sender: UITextField) {
        self.search(value: sender.text)
    }
    
    func search(value: String?) {
        if value != nil && value != "" {
            self.searchData(value: value!)
        }
        else
        {
            self.loadData()
        }
    }
    
    func searchData(value: String) {
        self.viewNoDataFound.isHidden = true
        self.viewLoading.isHidden = false
        self.data = []
        self.searchByViewType(value)
    }
    
    func searchByViewType(_ value: String) {
        switch typeView {
        case typeViewEnum.people:
            People.search(value) {
                (result, status) in
                self.labelInfo.text = "\(result!.count) results founded"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        case typeViewEnum.starship:
            Starships.search(value) {
                (result, status) in
                self.labelInfo.text = "\(result!.count) results founded"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        case typeViewEnum.film:
            Films.search(value) {
                (result, status) in
                self.labelInfo.text = "\(result!.count) results founded"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        case typeViewEnum.planet:
            Planets.search(value) {
                (result, status) in
                self.labelInfo.text = "\(result!.count) results founded"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        }
    }
    
    func loadData() {
        self.viewNoDataFound.isHidden = true
        self.viewLoading.isHidden = false
        self.data = []
        self.loadByViewType()
    }
    
    func loadByViewType() {
        switch typeView {
        case typeViewEnum.people:
            People.getMostAccessed() {
                (result, status) in
                self.labelInfo.text = "Most Accessed"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        case typeViewEnum.starship:
            Starships.getMostAccessed() {
                (result, status) in
                self.labelInfo.text = "Most Accessed"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        case typeViewEnum.film:
            Films.getMostAccessed() {
                (result, status) in
                self.labelInfo.text = "Most Accessed"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        case typeViewEnum.planet:
            Planets.getMostAccessed() {
                (result, status) in
                self.labelInfo.text = "Most Accessed"
                self.viewLoading.isHidden = true
                
                if status == HTTPStatusCodes.OK {
                    self.data = result
                    self.dataTableView.reloadData()
                }
                
                if (self.data!.count == 0) {
                    self.viewNoDataFound.isHidden = false
                }
            }
            break
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data!.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.InstanceNib) as! DataTableViewCell!
        
        
        var name = "";
        var image: UIImage;
        // set the text from the data model
        switch typeView {
        case typeViewEnum.people:
            name = (self.data?[indexPath.item] as! Person).name
            image = #imageLiteral(resourceName: "avatar")
            break
        case typeViewEnum.starship:
            name = (self.data?[indexPath.item] as! Starship).name
            image = #imageLiteral(resourceName: "starship")
            break
        case typeViewEnum.film:
            name = (self.data?[indexPath.item] as! Film).title
            image = #imageLiteral(resourceName: "film")
            break
        case typeViewEnum.planet:
            name = (self.data?[indexPath.item] as! Planet).name
            image = #imageLiteral(resourceName: "planet")
            break
        }
        
        cell?.config(text: name, image: image)
        
        return cell!
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.data = self.data![indexPath.item]
        vc.typeView = self.typeView
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
