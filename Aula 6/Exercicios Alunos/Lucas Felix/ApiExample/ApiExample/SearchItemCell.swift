//
//  SearchItemCell.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class SearchItemCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemView.layer.cornerRadius = 5
        itemImage.layer.cornerRadius = itemImage.frame.size.width/2
        itemImage.clipsToBounds = true
    }
    
    func config(label: String){
        self.itemLabel.text = label
    }
}
