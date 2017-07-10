//
//  UITableViewCell.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class PeopleUITableViewCell : UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var instanceNib : String {
        get {
            return "people-cell"
        }
    }
    
    func config(name: String) {
        self.lbName.text = name
    }
}
