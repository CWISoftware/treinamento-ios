//
//  ViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var peopleButton: RoundShadowedView!
    @IBOutlet weak var starshipButton: RoundShadowedView!
    @IBOutlet weak var filmButton: RoundShadowedView!
    @IBOutlet weak var planetsButton: RoundShadowedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap = UITapGestureRecognizer(target: self, action: #selector(peopleButtonTapped))
        peopleButton.addGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(starshipButtonTapped))
        starshipButton.addGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(filmButtonTapped))
        filmButton.addGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(planetsButtonTapped))
        planetsButton.addGestureRecognizer(tap)
    }
    
    func peopleButtonTapped(sender:UITapGestureRecognizer) {
        print("go to people")
        self.goToSearch(ItemType.People)
    }
    
    func starshipButtonTapped(sender:UITapGestureRecognizer) {
        print("go to starship")
        self.goToSearch(ItemType.Starship)
    }
    
    func filmButtonTapped(sender:UITapGestureRecognizer) {
        print("go to film")
        self.goToSearch(ItemType.Film)
        
    }
    
    func planetsButtonTapped(sender:UITapGestureRecognizer) {
        print("go to planets")
        self.goToSearch(ItemType.Planet)
        
    }
    
    func goToSearch(_ type: ItemType) {
        let mainStoryboard = self.storyboard
        let vc = mainStoryboard!.instantiateViewController(withIdentifier: "search-view") as!SearchViewController
        vc.type = type
        self.navigationController?.pushViewController(vc, animated: true)

    }


}

