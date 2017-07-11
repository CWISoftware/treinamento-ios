//
//  PeopleViewController.swift
//  starWarsApp
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    
    var peopleArray = [People]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchPeople(name: "")
        
        
    }
    
    @IBOutlet weak var mostAcessedView: UIView!
    
    @IBOutlet weak var notFoundImage: UIImageView!
    
    @IBOutlet weak var errorMessageField: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var peopleTableView: UITableView!

    
    func searchPeople(name: String){
        
        self.resetToPreSearchState()
        
        self.activityIndicator.startAnimating()
        self.peopleArray = []
        
        People.searchPeople(name: name) {(peopleArray, error) in
            
            self.peopleArray = peopleArray!
            
            if(error == 0){
                if(peopleArray?.count == 0){
                    self.notFoundImage.isHidden = false
                    self.showErrorMessage(message: "No people found")
                }
                
                self.peopleArray = peopleArray!
            }
            else if (error == 1){

                let message = String(peopleArray?.count == 0 ? "No internet found" : "No internet found \n(Data may not be up to date)")
                
                self.showErrorMessage(message: message!)
                
            }
            else{
                self.showErrorMessage(message: "Unknown error")
            }
     
            self.peopleTableView.reloadData()
            self.activityIndicator.stopAnimating()
            
        }
    }
    
    func showErrorMessage(message: String) {
        self.errorMessageField.isHidden = false
        self.errorMessageField.text = message
    }
    
    func resetToPreSearchState() {
        //self.mostAcessedView.isHidden = true
        self.errorMessageField.isHidden = true
        self.notFoundImage.isHidden = true
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchPeople(name: textField.text!)
        return true
    }
    
    // MARK: Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PeopleCellViewController.nameOfCell) as! PeopleCellViewController
        
        let name = peopleArray[indexPath.item].name
        
        cell.changeText(text: name)
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //
    //        let cell = tableView.dequeueReusableCell(withIdentifier: FooterViewController.nameOfCell) as! FooterViewController
    //        cell.addTagToButton(tag: section)
    //
    //        return cell
    //
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.peopleArray.count
    }
    
    // MARK: Delegate
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "peopleDetailViewController") as! PeopleDetailViewController
            self.navigationController?.pushViewController(detailViewController, animated: true)

        }
}
