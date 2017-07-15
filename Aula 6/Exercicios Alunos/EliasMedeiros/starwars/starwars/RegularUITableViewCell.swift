//
//  RegularCell.swift
//  starwars
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RegularUITableViewCell : UITableViewCell {
    
    
    @IBOutlet var imageContainer: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    func config(text: String) {
        label.text = text
    }
    
    class var instanceNib: String {
        get{
            return "regular-cell"
        }
    }
    
}
