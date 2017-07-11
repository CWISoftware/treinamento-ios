//
//  PeopleCellViewController.swift
//  starWarsApp
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class PeopleCellViewController: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    class var nameOfCell : String {
        get {
            return "people-cell"
        }
    }
    
    func changeText(text : String){
        
        self.name.text = text
    }
}
