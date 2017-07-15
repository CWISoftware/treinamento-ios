//
//  PeopleViewController.swift
//  starwars
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit


enum SearchType : String {
    case people;
    case starship;
    case movie;
    case planet;
}

class SearchViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var currentSearchType: SearchType!
    
    internal var dataList = Array<ListItem>()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    class func initializeViewController (searchType: SearchType, storyboard: UIStoryboard) -> SearchViewController {
        let searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        searchViewController.currentSearchType = searchType
        
        return searchViewController
    }
    
    var searchParams: Dictionary<SearchType, String> = [
        SearchType.people: "people/?search=:query",
        SearchType.starship: "starships/?search=:query",
        SearchType.movie: "films/?search=:query",
        SearchType.planet: "planets/?search=:query"
    ]
    
    override func viewDidLoad() {
        self.titleLabel.text = String(describing: currentSearchType!).capitalized(with: nil)
    }
    
    @IBAction func touchBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchTextEditingChanged(_ sender: UITextField) {
        let text = sender.text
        
        if (text?.characters.count)! >= 3 {
            self.doSearch(param: text!)
        } else {
            print("Query too short")
        }
    }
    
    private func doSearch(param: String) {
        let urlFragment = searchParams[currentSearchType]!.replacingOccurrences(of: ":query", with: param)
        
        ListItem.populateList(urlFragment) { (response) in
            print(response)
            self.dataList = response
            self.tableView.reloadData()
        }
    }
    
}

extension SearchViewController {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegularUITableViewCell.instanceNib) as! RegularUITableViewCell
        
        cell.label.text = dataList[indexPath.item].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataList[indexPath.item]
        
        print(item.detailUrl)
    }
    
}
