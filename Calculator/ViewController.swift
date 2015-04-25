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
    
    var operandStack = Array<Double>()

    @IBAction func enter() {
        
        isSetToZero = true
        operandStack.append(displayValue)
        println("stack = \(operandStack)")
        
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
        let operation = sender.currentTitle!
        
        if !isSetToZero {
            enter()
        }
        
        switch operation {
        case "✕": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "−": performOperation { $1 - $0 }
        case "+": performOperation { $0 + $1 }
        default: break
        }
        
    }
    
    
    func performOperation (operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operandStack.removeLast() * operandStack.removeLast()
            enter()
        }
    }
 
    
    
}

