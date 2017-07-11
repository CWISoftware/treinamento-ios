//
//  SearchController.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var header: AppHeader!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var notFoundView: UIView!
    @IBOutlet weak var notFoundMessage: UILabel!
    
    var category: Category?
    var searchService: SearchableService?
    var list  = [Searchable]()
    var tableCell: UITableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryValue = self.category!.rawValue
        
        self.setSearchService()
        
        self.searchField.delegate = self
        
        self.header.headerTitle = categoryValue
        self.header.btnBack.isHidden = false
        self.header.backAction = self.back

        self.table.rowHeight = 70
        
        self.notFoundMessage.text = "No \(categoryValue) Found"
        self.notFoundView.isHidden = true
        
        self.showLoader()
        
        self.loadMostAccessed(page: 1)
    }
    
    private func setSearchService() {
        switch self.category! {
        case Category.PEOPLE: self.searchService = PeopleService()
        break;
        case Category.STARSHIP: self.searchService = StarshipService()
        break;
        case Category.FILM: self.searchService = FilmService()
            break;
        case Category.PLANET: self.searchService = PlanetService()
            break;
        }
    }
    
    private func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func loadMostAccessed(page: Int) {
        searchService!.getMostAccessed() { (list, status) in
            if status != NetworkStatus.NOT_CONNECTED {
                self.list = list
                self.table.reloadData()
                self.hideLoader()
            } else {
                print("most accessed: network nor connected")
            }
        }
    }
    
    private func search(name: String, page: Int) {
        searchService!.get(name: name, page:page) { (list, status) in
            if status != NetworkStatus.NOT_CONNECTED {
                self.list.append(contentsOf: list)
                self.table.reloadData()
                self.hideLoader()
            } else {
                print("search: network not connected")
            }

        }
    }
    
    private func showLoader() {
        self.loaderView.isHidden = false;
        self.loader.startAnimating()
    }
    
    private func hideLoader() {
        self.loaderView.isHidden = true
        self.loader.stopAnimating()
        self.toggleNotFoundView()
    }
    
    private func toggleNotFoundView() {
        self.notFoundView.isHidden = self.list.count > 0
    }
    
    private func toDetail(model: Searchable) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        nextViewController.model = model
        nextViewController.category = self.category
            
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: TextView Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let search = self.searchField.text!
        
        showLoader()
        
        self.list = [Searchable]()
        
        self.search(name: search, page: 1)
        
        self.searchField.resignFirstResponder()
        return true
    }
    // -->
    
    // MRK: TableView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item_cell") as! TableCell
        let currentItem = self.list[indexPath.section]
        
        cell.config(labelText: currentItem.name)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.list[indexPath.section]
        
        toDetail(model: selectedItem)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let currentItem = self.list[section]
        
        let index = self.list.index(where: { $0.name == currentItem.name })
        
        if (self.list.count >= 10 && index! == (self.list.endIndex - 1)) {
            showLoader()
            
            let currentPage = (self.list.count / 10)
            let currentName = self.searchField.text!
            
            self.search(name: currentName, page: currentPage + 1)
        }
    }
    // -->
}
