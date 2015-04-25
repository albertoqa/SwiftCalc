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
    var isSetToZero: Bool = true
    
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
        if(!isSetToZero) {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            isSetToZero = false
        }
        
        //println("digit = \(digit)")
        
    }

}

