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
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "x" : Operation.binaryOperation({ $0 * $1 }),
        "/" : Operation.binaryOperation({ $0 / $1 }),
        "=" : Operation.equals
    ]
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    mutating func setOperator(_ operand : Double) {
        self.acumulador = operand
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                self.acumulador = value
            case .unaryOperation(let function):
                if acumulador != nil {
                    self.acumulador = function(acumulador!)
                }
            case .binaryOperation(let function):
                if acumulador != nil {
                    self.pbo = PedingBinaryOperation(function: function, firstOperand: acumulador!)
                    acumulador = nil
                }
            case .equals:
                perfomPedingBinaryOperation()
            }
        }
    }
    
    mutating func perfomPedingBinaryOperation() {
        if pbo != nil && acumulador != nil {
            acumulador = pbo!.perfom(with: acumulador!)
            pbo = nil
        }
    }
    
    private var pbo: PedingBinaryOperation?
    
    private struct PedingBinaryOperation {
        let function : ((Double, Double) -> Double)
        let firstOperand: Double
        
        func perfom(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    var result : Double? {
        get {
            return acumulador
        }
    }
    
}
