//
//  TableCell.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func config(labelText: String) {
        self.label.text = labelText
        //self.cellImage.image = UIImage(named: imageName)
        
        self.cellImage.layer.cornerRadius = 25
    }
}
