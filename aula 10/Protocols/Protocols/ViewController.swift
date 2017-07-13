//
//  ViewController.swift
//  Protocols
//
//  Created by Juliano Krieger Nardon on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewBackgroundDelegate {

    @IBOutlet weak var organgeView: ViewLaranja!
    @IBOutlet weak var leadingViewLaranja: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        organgeView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func animate(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
                })
        
        UIView.animate(withDuration: 2, animations: {
            self.organgeView.frame = CGRect(x: 20, y: 20, width: 400, height: self.organgeView.frame.height)
            self.organgeView.backgroundColor = UIColor.blue
            self.organgeView.alpha = 0

        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.organgeView.alpha = 1
            })
        }
        
    }
    
    func setBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
}

