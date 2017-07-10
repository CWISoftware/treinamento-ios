//
//  PeopleTableViewCell.swift
//  Aula6
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class DataTableViewCell : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataImage: UIImageView!
    
    override func awakeFromNib() {
    }
    
    class var InstanceNib : String {
        get {
            return "data-cell"
        }
    }
    
    func config(text: String, image: UIImage) {
        self.nameLabel.text = text
        self.dataImage.image = image
    }
}
