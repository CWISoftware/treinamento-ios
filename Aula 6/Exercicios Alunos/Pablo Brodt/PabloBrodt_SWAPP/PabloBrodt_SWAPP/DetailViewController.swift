//
//  PeopleDetailViewController.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var header: AppHeader!
    @IBOutlet weak var imageMask: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var info1PropLabel: UILabel!
    @IBOutlet weak var info1ValueLabel: UILabel!
    
    @IBOutlet weak var info2PropLabel: UILabel!
    @IBOutlet weak var info2ValueLabel: UILabel!
    
    @IBOutlet weak var info3PropLabel: UILabel!
    @IBOutlet weak var info3ValueLabel: UILabel!
    

    var category: Category?
    var model: Searchable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.header.headerTitle = self.category!.rawValue
        self.header.btnBack.isHidden = false
        self.header.bgImage.isHidden = true
        self.header.backAction = self.back
        
        self.nameLabel.text = self.model!.name
        
        self.imageMask.layer.cornerRadius = 60
        self.profileImage.layer.cornerRadius = 45
        
        let data = self.model!.getDetailProperties()
        var props = Array(data.keys)
        var values = Array(data.values)
        
        self.info1PropLabel.text = props[0].uppercased()
        self.info2PropLabel.text = props[1].uppercased()
        self.info3PropLabel.text = props[2].uppercased()
        
        self.info1ValueLabel.text = values[0]
        self.info2ValueLabel.text = values[1]
        self.info3ValueLabel.text = values[2]
    }
    
    private func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
