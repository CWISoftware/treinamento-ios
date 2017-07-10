//
//  HeaderUITableViewCell.swift
//  TableView
//
//  Created by retina on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HeaderUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var resultText: UILabel!
    
    func config(resultText: String) {
        self.resultText.text = resultText
    }
}
