//
//  ViewController.swift
//  Calculator2
//
//  Created by 양주원 on 3/7/24.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case Unknown
}
class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    // 현재 연산자에 어떤 연산자가 저장되어있는지 알수있게함
    var currentOperation: Operation = .Unknown
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
    }
    
    @IBAction func tapPlusButton(_ sender: UIButton) {
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
    }
    
}

