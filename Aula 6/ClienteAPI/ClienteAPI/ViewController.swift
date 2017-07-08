//
//  ViewController.swift
//  ClienteAPI
//
//  Created by Juliano Krieger Nardon on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var person : Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loaderActivityIndicator.isHidden = true
        self.loaderActivityIndicator.hidesWhenStopped = true
    }
    
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func callAPI(_ sender: UIButton) {
        
        self.loaderActivityIndicator.startAnimating()
        
        Person.getPerson(1) { (person, error) in
            if let response = person {
                if error == 0 {
                    self.person = response
                }
            } else {
                print("Sem Internet")
            }
            
            self.loaderActivityIndicator.stopAnimating()
        }
    }
}

