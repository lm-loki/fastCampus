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
    // 첫번째 피연산자
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    // 현재 선택된 연산자
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
        print("tap")
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .Unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapPlusButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
      if self.currentOperation != .Unknown {
        if !self.displayNumber.isEmpty {
          self.secondOperand = self.displayNumber
          self.displayNumber = ""

          guard let firstOperand = Double(self.firstOperand) else { return }
          guard let secondOperand = Double(self.secondOperand) else { return }

          switch self.currentOperation {
          case .Add:
            self.result = "\(firstOperand + secondOperand)"

          case .Subtract:
            self.result = "\(firstOperand - secondOperand)"

          case .Divide:
            self.result = "\(firstOperand / secondOperand)"

          case .Multiply:
            self.result = "\(firstOperand * secondOperand)"

          default:
            break
          }

          if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
            self.result = "\(Int(result))"
          }

          self.firstOperand = self.result
          self.numberOutputLabel.text = self.result
        }

        self.currentOperation = operation
      } else {
        self.firstOperand = self.displayNumber
        self.currentOperation = operation
          // 예를 들어 3+ 한 이후 다른 숫자 누를시 다른숫자만 displatNumber에 나와야해서 비웠음
        self.displayNumber = ""
      }
    }
}

