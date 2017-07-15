//
//  ViewController.swift
//  starwars
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var peopleButton: UIButton!
    
    @IBOutlet weak var starshipButton: UIButton!
    
    @IBOutlet weak var movieButton: UIButton!
    
    @IBOutlet weak var planetButton: UIButton!
    
    override func viewDidLoad() {
        applyStyle()
    }
    
    @IBAction func touchPeople(_ sender: Any) {
        openSearch(searchType: .people)
    }
    
    @IBAction func touchStarship(_ sender: Any) {
        openSearch(searchType: .starship)
    }
    
    @IBAction func touchMovie(_ sender: Any) {
        openSearch(searchType: .movie)
    }
    
    @IBAction func touchPlanets(_ sender: Any) {
        openSearch(searchType: .planet)
    }
    
    private func openSearch(searchType: SearchType) {
        let searchViewController = SearchViewController.initializeViewController(searchType: searchType, storyboard: self.storyboard!)
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    private func applyStyle() {
        let items = [peopleButton, starshipButton, movieButton, planetButton]
        
        for item in items {
            item?.layer.cornerRadius = 4
            item?.layer.shadowRadius = 1
            item?.layer.shadowOpacity = 0.5
            item?.layer.shadowRadius = 1
            item?.layer.shadowOffset = CGSize(width: 0, height: 2)
            item?.layer.masksToBounds = false
            item?.layer.shadowColor = UIColor(hexString: "000").cgColor
        }

    }


}

