//
//  PeopleViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//
import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imgProhibited: UIImageView!
    
    var type = ItemType.People
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.lblTitle.text = self.type.rawValue
    }

    
    
    @IBAction func txtSearchDidChange(_ sender: UITextField) {
        self.search()
    }
    
    
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func loadData() {
        switch self.type {
        case .People:
            Person.getAll() { (person, error) in
                if let response = person {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        case .Starship:
            Starship.getAll() { (starship, error) in
                if let response = starship {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        case .Film:
            Film.getAll() { (film, error) in
                if let response = film {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        case .Planet:
            Planet.getAll() { (planet, error) in
                if let response = planet {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        }
        
    }
    
    func search() {
        switch self.type {
        case .People:
            Person.getPeople(self.txtSearch.text!) { (person, error) in
                if let response = person {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        case .Starship:
            Starship.getStarships(self.txtSearch.text!) { (starship, error) in
                if let response = starship {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        case .Film:
            Film.getFilms(self.txtSearch.text!) { (film, error) in
                if let response = film {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        case .Planet:
            Planet.getPlanets(self.txtSearch.text!) { (planet, error) in
                if let response = planet {
                    if error == 0 {
                        self.items = response
                        print(response)
                    }
                } else {
                    print("Sem internet")
                }
                self.doTableRefresh()
            }
        }
        
    }
    
    func doTableRefresh()
    {
        DispatchQueue.main.async(execute: {
            self.myTableView.reloadData()
            self.loadingActivityIndicator.stopAnimating()
            self.imgProhibited.isHidden = !self.items.isEmpty
            return
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count < 6 ? self.items.count : 6 ///Exibir apenas 6 itens
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCellRow.instanceNib) as! TableCellRow
        
        let item = self.items[indexPath.row]
        
        cell.config(itemImage: nil, itemText: item.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        
        let item = self.items[indexPath.row]
        
        let mainStoryboard = self.storyboard
        let vc = mainStoryboard!.instantiateViewController(withIdentifier: "detail-view") as! DetailViewController
        vc.type = self.type
        vc.object = item
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
