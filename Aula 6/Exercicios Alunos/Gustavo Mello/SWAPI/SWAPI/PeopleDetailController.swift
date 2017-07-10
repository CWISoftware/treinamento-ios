//
//  PeopleDetailController.swift
//  SWAPI
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class PeopleDetailController: UIViewController {
    @IBOutlet weak var lbName: UILabel!

    var idPeople: Int!
    var people: People!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PeopleService.findById(self.idPeople) { (peopleDetail, error) in
            self.people = peopleDetail!
            self.lbName.text = self.people.name
        }
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}
