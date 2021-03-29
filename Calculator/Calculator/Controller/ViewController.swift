//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var screenText: UILabel!
    
    @IBOutlet var dot: UIButton!
    @IBOutlet var num0: UIButton!
    @IBOutlet var num1: UIButton!
    @IBOutlet var num2: UIButton!
    @IBOutlet var num3: UIButton!
    @IBOutlet var num4: UIButton!
    @IBOutlet var num5: UIButton!
    @IBOutlet var num6: UIButton!
    @IBOutlet var num7: UIButton!
    @IBOutlet var num8: UIButton!
    @IBOutlet var num9: UIButton!
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var multiplyBtn: UIButton!
    @IBOutlet var divideBtn: UIButton!
    @IBOutlet var clearBtn: UIButton!
    @IBOutlet var equalBtn: UIButton!
    
    var calculator = DecimalCalculator()
    var printNum = 0
    
    @IBAction func numBtn(_ sender: UIButton) {
        switch sender {
        case plusBtn:
            calculator.operandAndOperatorValidation(inputText: "+")
        case minusBtn:
            calculator.operandAndOperatorValidation(inputText: "-")
        case multiplyBtn:
            calculator.operandAndOperatorValidation(inputText: "*")
        case divideBtn:
            calculator.operandAndOperatorValidation(inputText: "/")
        case equalBtn:
            calculator.operandAndOperatorValidation(inputText: "=")
        case clearBtn:
            calculator.operandAndOperatorValidation(inputText: "clear")
            screenText.text = "0"
        default:
            printNum = printNum * 10 + sender.tag
            screenText.text = "\(printNum)"
            calculator.operandAndOperatorValidation(inputText: String(screenText.text!))
        }
        screenText.text = "\(calculator.operandStack.peekLast()!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    func setup() {
        screenText.text = "0"
        
        num1.calcBtn()
        num2.calcBtn()
        num3.calcBtn()
        num4.calcBtn()
        num5.calcBtn()
        num6.calcBtn()
        num7.calcBtn()
        num8.calcBtn()
        num9.calcBtn()
        dot.calcBtn()
        
        plusBtn.operatorBtn()
        minusBtn.operatorBtn()
        multiplyBtn.operatorBtn()
        divideBtn.operatorBtn()
        clearBtn.operatorBtn()
        equalBtn.operatorBtn()
        
        dot.setTitle(".", for: .normal)
        
        num0.setTitle("0", for: .normal)
        num0.frame.size.width = 170
        num0.frame.size.height = 60
        num0.layer.cornerRadius = 30
        num0.backgroundColor = .systemGray
        num0.setTitleColor(.white, for: .normal)
        num0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

}

extension UIButton {
    func calcBtn() {
        self.setTitle("\(self.tag)", for: .normal)
        self.frame.size.width = 60
        self.frame.size.height = 60
        self.layer.cornerRadius = self.frame.width / 2
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.backgroundColor = .systemGray
    }
    
    func operatorBtn() {
        self.frame.size.width = 60
        self.frame.size.height = 60
        self.layer.cornerRadius = self.frame.width / 2
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.backgroundColor = .systemOrange
    }
}
