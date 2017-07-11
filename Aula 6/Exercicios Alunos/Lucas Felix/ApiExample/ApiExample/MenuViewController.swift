//
//  ViewController.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func onTouchCategory(_ sender: UIButton) {
    
        let searchViewController = SearchViewController.initializeViewController(stringPassed: "Person", storyboard: self.storyboard!)
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
}

