//
//  ViewController.swift
//  calculadora
//
//  Created by saul on 03/02/15.
//  Copyright (c) 2015 SaulGausin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypping = false
    let π = M_PI

    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        println("digit : \(digit)")
        if userIsInTheMiddleOfTypping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypping = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypping {
            enter()
        }
        
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    
    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue : Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypping = false
        }
    }

}

