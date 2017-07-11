//
//  ViewController.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var people: CategoryButton!
    @IBOutlet weak var starship: CategoryButton!
    @IBOutlet weak var film: CategoryButton!
    @IBOutlet weak var planet: CategoryButton!
    @IBOutlet weak var header: AppHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.people.callbackFn = self.searchPeople
        self.starship.callbackFn = self.searchStarship
        self.film.callbackFn = self.searchFilm
        self.planet.callbackFn = self.searchPlanet
        
        self.header.btnBack.isHidden = true;
    }
    
    func teste() {
        print("teste")
    }
    
    private func searchPeople() {
        self.next(Category.PEOPLE);
    }
    
    private func searchStarship() {
        self.next(Category.STARSHIP);
    }
    
    private func searchFilm() {
        self.next(Category.FILM);
    }
    
    private func searchPlanet() {
        self.next(Category.PLANET);
    }
    
    private func next(_ category: Category) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        nextViewController.category = category
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    

}

