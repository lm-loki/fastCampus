//
//  ViewController.swift
//  Calculator
//
//  Created by 양주원 on 3/5/24.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    //currentOperation 현재 연산자가 어떤 연산자인지 알수있게 함
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
                //9자리까지만 표기할수있게함
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

