//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dCalc = DecimalCalculator()
        dCalc.opperandAndOperatorValidation(inputText: "1100")
        dCalc.opperandAndOperatorValidation(inputText: "+")
        dCalc.opperandAndOperatorValidation(inputText: "100")
        dCalc.opperandAndOperatorValidation(inputText: "*")

        print(dCalc.opperandStack)
        print(dCalc.operatorStack)
        
        print("--------------------------------------------------")
        
        
        let bCalc = BinaryCalculator()
        bCalc.opperandAndOperatorValidation(inputText: "10")
        bCalc.opperandAndOperatorValidation(inputText: "*")
        bCalc.opperandAndOperatorValidation(inputText: "10")
        bCalc.opperandAndOperatorValidation(inputText: "+")
        bCalc.opperandAndOperatorValidation(inputText: "10")
        bCalc.opperandAndOperatorValidation(inputText: "=")
        
        print(bCalc.operatorStack)
    }
}
