//
//  SecondViewController.swift
//  DemoTestes
//
//  Created by Juliano Krieger Nardon on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

