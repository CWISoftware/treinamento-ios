//
//  ViewController.swift
//  starWarsApp
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toPeopleStep(_ sender: Any) {
        let peopleViewController = self.storyboard?.instantiateViewController(withIdentifier: "peopleViewController") as! PeopleViewController
        self.navigationController?.pushViewController(peopleViewController, animated: true)
    }
    
  }

