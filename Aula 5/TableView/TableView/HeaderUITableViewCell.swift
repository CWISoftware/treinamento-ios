//
//  HeaderUITableViewCell.swift
//  TableView
//
//  Created by Juliano Krieger Nardon on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HeaderUITableViewCell : UITableViewCell {
    
    @IBOutlet weak var stateLabel: UILabel!
    
    func config(stateText: String) {
        self.stateLabel.text = stateText
    }
    
    
}
