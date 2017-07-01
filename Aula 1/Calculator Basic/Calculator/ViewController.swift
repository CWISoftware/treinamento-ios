//
//  ViewController.swift
//  Calculator
//
//  Created by Juliano Krieger Nardon on 30/06/17.
//  Copyright © 2017 Juliano Krieger Nardon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        var digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            var textCurrentInDisplay = display.text!
            display.text = textCurrentInDisplay + digit
        } else {
            display.text =  digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performAction(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let operation = sender.currentTitle {
            switch operation {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
}

