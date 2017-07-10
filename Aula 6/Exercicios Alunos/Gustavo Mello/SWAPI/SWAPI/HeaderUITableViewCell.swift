//
//  HeaderUITableViewCell.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

class HeaderUITableViewCell : UITableViewCell {
    @IBOutlet weak var stateLabel: UILabel!
    
    func config(stateText: String) {
        self.stateLabel.text = stateText
    }
    
    class var instanceNib : String {
        get {
            return "header-cell"
        }
    }
}
