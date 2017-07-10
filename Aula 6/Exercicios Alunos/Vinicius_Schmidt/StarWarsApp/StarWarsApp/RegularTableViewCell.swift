//
//  RegularUITableViewCell.swift
//  TableView
//
//  Created by retina on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RegularUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelResult: UILabel!
    
    var url : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var instanceNib : String {
        get {
            return "regular-cell"
        }
    }
    
    func config(_ person: Person) {
        self.labelResult.text = person.name
    }
    
    func config(_ film: Film) {
        self.labelResult.text = film.title
    }
    
    func config(_ starship: Starship) {
        self.labelResult.text = starship.name
    }
    
    func config(_ planet: Planet) {
        self.labelResult.text = planet.name
    }
    
}
