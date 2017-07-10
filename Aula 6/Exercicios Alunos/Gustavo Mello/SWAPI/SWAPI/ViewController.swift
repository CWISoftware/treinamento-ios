//
//  ViewController.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var vwStarship: UIView!
    @IBOutlet weak var vwPeople: UIView!
    @IBOutlet weak var vwFilm: UIView!
    @IBOutlet weak var vwPlanets: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let corner: CGFloat = 5
        
        vwStarship.layer.cornerRadius = corner
        vwFilm.layer.cornerRadius = corner
        vwPlanets.layer.cornerRadius = corner
        vwPeople.layer.cornerRadius = corner
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPeople(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

