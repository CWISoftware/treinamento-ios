//
//  DetailViewController.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var type = ItemType.People
    var object = Item()
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var lblLeftPropertyName: UILabel!
    @IBOutlet weak var lblLeftPropertyValue: UILabel!
    @IBOutlet weak var lblCenterPropertyName: UILabel!
    @IBOutlet weak var lblCenterPropertyValue: UILabel!
    @IBOutlet weak var lblRightPropertyName: UILabel!
    @IBOutlet weak var lblRightPropertyValue: UILabel!
    
    override func viewDidLoad() {
        self.lblTitle.text = self.type.rawValue
        self.profileName.text = object.name
        self.lblLeftPropertyName.text = object.leftPropertyName
        self.lblLeftPropertyValue.text = object.leftPropertyValue
        self.lblCenterPropertyName.text = object.centerPropertyName
        self.lblCenterPropertyValue.text = object.centerPropertyValue
        self.lblRightPropertyName.text = object.rightPropertyName
        self.lblRightPropertyValue.text = object.rightPropertyValue
        
    }
    
    
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
