//
//  ViewController.swift
//  Aula6
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func peopleAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        vc.typeView = typeViewEnum.people
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func starshipAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        vc.typeView = typeViewEnum.starship
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func filmAction(_ sender: UIButton) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
            vc.typeView = typeViewEnum.film
            navigationController?.pushViewController(vc, animated: true)

    }
        
    @IBAction func planetsAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        vc.typeView = typeViewEnum.planet
        navigationController?.pushViewController(vc, animated: true)
    }
}

