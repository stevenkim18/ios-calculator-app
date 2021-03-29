//
//  Calculrator.swift
//  Calculator
//
//  Created by TORI on 2021/03/23.
//

import Foundation

struct Stack<Element> {
    var storage = Array<Element>()
    
    var count: Int {
        return storage.count
    }
    
    mutating func push(element: Element) {
        storage.append(element)
    }
    
    mutating func popFirst() -> Element? {
        return storage.removeFirst()
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    mutating func clear() {
        storage.removeAll()
    }
    
    func peekFirst() -> Element? {
        return storage.first
    }
    
    func peekLast() -> Element? {
        return storage.last
    }
    
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
}

//struct Stack<Element> {
//    var storage = Array<Element>()
//
//    var count: Int {
//        return storage.count
//    }
//
//    mutating func push(element: Element) {
//        storage.append(element)
//    }
//
//    mutating func pop() -> Element? {
//        return storage.popLast()
//    }
//
//    mutating func clear() {
//        storage.removeAll()
//    }
//
//    func peek() -> Element? {
//        return storage.last
//    }
//
//    func isEmpty() -> Bool {
//        return storage.isEmpty
//    }
//}

// 숫자를 누르면 숫자덱에, 연산자를 누르면 연산자덱에 enque
// 연산자를 누르면 숫자덱의 개수를 확인하고 연산 후, 숫자덱에 연산결과 enque
class DecimalCalculator {
    var operandStack = Stack<Int>()
    var operatorStack = Stack<String>()
    
    func operandAndOperatorValidation(inputText: String) {
        if let change = Int(inputText) {
            operandStack.push(element: change)
        } else {
            switch inputText {
            case "+", "-", "*", "/", "=":
                operatorStack.push(element: inputText)
                
                if operandStack.count <= 1 {
                    return
                } else {
                    calculation()
                }
            case "clear":
                operandStack.clear()
                operatorStack.clear()
            default:
                print("잘못된 입력 \(inputText)")
            }
        }
    }
    
    func calculation() {
        let inputOperator = operatorStack.popFirst()
        guard let opr1 = operandStack.popFirst() else {
            return
        }
        guard let opr2 = operandStack.popFirst() else {
            return
        }
        
        switch inputOperator {
        case "+":
            let result = opr1 + opr2
            operandStack.push(element: result)
        case "-":
            let result = opr1 - opr2
            operandStack.push(element: result)
        case "*":
            let result = opr1 * opr2
            operandStack.push(element: result)
        case "/":
            let result = opr1 / opr2
            operandStack.push(element: result)
        default:
            break
        }
    }
}


// 숫자 버튼을 누르면 숫자스택에 push
// 연산자를 누르면 연산자스택에 push
//class BinaryCalculator {
//    var operandStack = Stack<Int>()
//    var operatorStack = Stack<String>()
//
//    func opperandAndOperatorValidation(inputText: String) {
//
//        if let change = Int(inputText) {
//            // 숫자일 경우 숫자스택에 push
//            operandStack.push(element: change)
//        } else {
//            // 연산자일 경우
//            switch inputText {
//            case "+", "-", "*", "/":
//                if operatorStack.isEmpty() {
//                    // 연산자 스택이 비어있으면 push
//                    operatorStack.push(element: inputText)
//                } else {
//                    // 연산자 스택이 비어있지 않으면 우선 순위를 확인하고 push, pop
//                    let newValue = priorityComparison(value: inputText)
//                    let oldValue = priorityComparison(value: operatorStack.peek()!)
//
//                     if newValue <= oldValue {
//                        // oldValue의 우선순위가 높으면 연산자를 pop, 숫자를 두번 pop하고 연산 후 숫자 스택에 저장?
//                        operatorStack.push(element: inputText)
//                     } else {
//                        // oldValue의 우선순위가 낮으면 높은게 들어올때까지 스택에 push?
//                        operatorStack.push(element: inputText)
//                     }
//                }
//            case "=":
//                break
//                // 숫자 스택 두번 pop하고 연산자 스택 pop해서 연산하고 출력?
//            default:
//                break
//            }
//        }
//    }
//
//    func priorityComparison(value: String) -> Int {
//        var resultValue = 0
//
//        switch value {
//        case "+", "-":
//            resultValue = 1
//        case "*", "/":
//            resultValue = 2
//        default:
//            print("잘못된 입력\(value)")
//        }
//
//        return resultValue
//    }
//}
