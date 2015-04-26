//
//  ViewController.swift
//  Calculator
//
//  Created by Alberto Quesada Aranda on 25/04/15.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isSetToZero = true
    var brain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func appendDigit(sender: UIButton) {
        // var = variable, let = constante
        let digit = sender.currentTitle!
        if !isSetToZero {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            isSetToZero = false
        }
        //println("digit = \(digit)")
        
    }
    
    @IBAction func enter() {
        isSetToZero = true
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        set {
            display.text = "\(newValue)"
            isSetToZero = true
        }
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if !isSetToZero {
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
    
    
}

