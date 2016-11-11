//
//  ViewController.swift
//  NoobCalculator
//
//  Created by Hiroki on 2016/11/10.
//  Copyright © 2016年 Brainya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorDisplay: UILabel!
    
    var isTypingNumber: Bool = false
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var operation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if isTypingNumber == true {
            calculatorDisplay.text = String(Int(calculatorDisplay.text!)! + Int(number)!)
        } else {
            calculatorDisplay.text = number
            isTypingNumber = true
        }
    }
    
    @IBAction func calculationTapped(_ sender: UIButton) {
        isTypingNumber = false
        firstNumber = Int(calculatorDisplay.text!)!
        operation = sender.currentTitle!
    }
    
    @IBAction func equalsTapped(_ sender: UIButton) {
        var result = 0
        
        isTypingNumber = false
        secondNumber = Int(calculatorDisplay.text!)!
        
        switch operation {
        case "＋":
            result = firstNumber + secondNumber
        case "−":
            result = firstNumber - secondNumber
        case "×":
            result = firstNumber * secondNumber
        case "÷":
            result = firstNumber / secondNumber
        default:
            return
        }
        
        calculatorDisplay.text = "\(result)"
    }
    
    @IBAction func allClearTapped(_ sender: UIButton) {
        calculatorDisplay.text = "0"
        isTypingNumber = false
        firstNumber = 0
        operation = ""
    }
}

