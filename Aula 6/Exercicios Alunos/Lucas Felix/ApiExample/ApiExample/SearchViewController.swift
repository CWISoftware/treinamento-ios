//
//  SearchView.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var resultsUITableView: UITableView!
    
    @IBOutlet weak var loadingUIActivityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var viewLoading: UIView!
    
    @IBOutlet weak var titleTab: UILabel!
    
    var sender : String?
    var list : [Any] = []
    
    class func initializeViewController (stringPassed: String, storyboard: UIStoryboard) -> SearchViewController {
        let searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        searchViewController.sender = stringPassed
        
        return searchViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingUIActivityIndicatorView.startAnimating()
        self.titleTab.text = sender
        
        
        switch sender! {
        case "Person":
            Person.getAll() { (person, error) in
                if let response = person {
                    if error == 0 {
                        self.list  = response as [Person]
                        self.resultsUITableView.reloadData()
                        self.loadingUIActivityIndicatorView.stopAnimating()
                        self.viewLoading.isHidden = true
                    }
                }
            }
        default:
            break
        }
    }
    
    @IBAction func onTouchBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: DATA SOURCE METHODS
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchItemCell = tableView.dequeueReusableCell(withIdentifier: "search-item-cell") as! SearchItemCell
        let index = indexPath.item
        
        switch sender! {
        case "Person":
            let item = list[index] as! Person
            searchItemCell.config(label: item.name)
        default: break
            
        }
        
        return searchItemCell
    }
    
    
    
    // MARK: DELEGATE METHODS
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchViewController = DetailViewController.initializeViewController(detailContent: self.list[indexPath.item], sender: self.sender!, storyboard: self.storyboard!)
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}
