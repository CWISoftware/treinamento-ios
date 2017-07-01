//
//  ViewController.swift
//  Calculadora
//
//  Created by Juliano Krieger Nardon on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlet
    @IBOutlet weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    private var brain = CalculatorBrain()
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if self.userIsInTheMiddleOfTyping {
            let textCurrentInDisplay = display.text!
            self.display.text = textCurrentInDisplay + digit
            
        } else {
            self.display.text = digit
            self.userIsInTheMiddleOfTyping = true
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
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        
        if self.userIsInTheMiddleOfTyping {
            brain.setOperator(displayValue)
            self.userIsInTheMiddleOfTyping = false
        }
        
        if let operation = sender.currentTitle {
            brain.performOperation(operador: operation)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

