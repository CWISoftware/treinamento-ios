//
//  ViewController.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func touchPersons(_ sender: UIButton) {
        onTouchCategory(sender: "Persons")

    }
    @IBAction func touchStarships(_ sender: UIButton) {
        onTouchCategory(sender: "Starships")

    }
    @IBAction func touchFilms(_ sender: UIButton) {
        onTouchCategory(sender: "Films")

    }
    @IBAction func touchPlanets(_ sender: UIButton) {
        onTouchCategory(sender: "Planets")
    }
    
    func onTouchCategory(sender: String) {
    
        let searchViewController = SearchViewController.initializeViewController(stringPassed: sender,storyboard: self.storyboard!)
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
}

