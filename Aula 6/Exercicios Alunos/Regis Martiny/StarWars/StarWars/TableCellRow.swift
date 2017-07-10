//
//  TableCellRow.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class TableCellRow : UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var txt: UILabel!
    
    class var instanceNib : String {
        get {
            return "table-row"
        }
    }
    
    func config(itemImage: String?, itemText: String) {
        //self.img.image = itemImage
        self.txt.text = itemText
    }
    
}
