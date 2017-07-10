//
//  ViewController.swift
//  StarWarsApp
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func searchPeople(_ sender: UIButton) {
        callSearchScreen(Data.SCREEN_OPTIONS.People.rawValue)
    }
    @IBAction func searchStarships(_ sender: UIButton) {
        callSearchScreen(Data.SCREEN_OPTIONS.Starships.rawValue)
    }
    
    @IBAction func searchFilms(_ sender: UIButton) {
        callSearchScreen(Data.SCREEN_OPTIONS.Films.rawValue)

    }
    @IBAction func searchPlanets(_ sender: UIButton) {
        callSearchScreen(Data.SCREEN_OPTIONS.Planets.rawValue)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func callSearchScreen(_ screen: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        vc.searchScreenType = screen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

