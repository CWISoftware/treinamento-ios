//
//  PeopleRowCell.swift
//  starWarsApp
//
//  Created by brunotrassante on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class PeopleRowViewController: UITableViewCell {
    
    class var nameOfCell : String {
        get {
            return "row-cell"
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    func changeText(text : String){
        
        self.label.text = text
    }
}
