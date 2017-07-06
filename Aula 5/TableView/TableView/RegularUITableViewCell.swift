//
//  RegularUITableViewCell.swift
//  TableView
//
//  Created by Juliano Krieger Nardon on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RegularUITableViewCell : UITableViewCell {
    
  
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    class var instanceNib : String {
        get {
            return "regular-cell"
        }
    }
    
    func config(cityText : String) {
        self.cityLabel.text = cityText
    }
    
}
