//
//  CalculatorBrain.swift
//  Calculadora
//
//  Created by Juliano Krieger Nardon on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var acumulador: Double?
    
    mutating func setOperator(_ operand : Double) {
        self.acumulador = operand
    }
    
    mutating func performOperation(operador: String) {
        
        switch operador {
        case "√":
            acumulador = sqrt(acumulador!)
        default:
            break
        }

    }
    
    var result : Double? {
        get {
            return acumulador
        }
    }
    
}
