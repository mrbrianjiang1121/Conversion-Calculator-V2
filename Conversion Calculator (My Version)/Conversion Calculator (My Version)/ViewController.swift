//
//  ViewController.swift
//  Conversion Calculator (My Version) Final Project
//
//  Created by Brian Jiang on 7/19/19.
//  Copyright © 2019 Brian Jiang. All rights reserved.
//

import UIKit

struct UnitConverter {
    let label: String
    let inputUnit: String
    let outputUnit: String
}

enum operations {
    case addition
    case subtraction
    case multiplication
    case division
    case idle
}

class ConversionCalculatorViewController: UIViewController {
    @IBOutlet weak var OutputDisplay: UITextField!
    @IBOutlet weak var InputDisplay: UITextField!
    
    var currentMode = operations.idle
    var textDisplay = "0"
    var previousNumber = 0
    var previousButtonWasMode = false
    var numberOnScreen = 0
    
    var conversions = [UnitConverter(label: "Fahrenheit to Celsius", inputUnit: "F°", outputUnit: "C°"),
                       UnitConverter(label: "Celsius to Fahrenheit", inputUnit: "C°", outputUnit: "F°"),
                        UnitConverter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
                        UnitConverter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi"),
                        UnitConverter(label: "Meters to Centimeters", inputUnit: "m", outputUnit: "cm"),
                        UnitConverter(label: "Centimeters to Meters", inputUnit: "cm", outputUnit: "m"),
                        UnitConverter(label: "Kilometers to Meters", inputUnit: "km", outputUnit: "m"),
                        UnitConverter(label: "Kilograms to Grams", inputUnit: "kg", outputUnit: "g"),
                        UnitConverter(label: "US Dollars to Chinese Yuan", inputUnit: "$", outputUnit: "¥"),
                        UnitConverter(label: "Chinese Yuan to US Dollars", inputUnit: "¥", outputUnit: "$")]
    
    var inputNum: Double = 0
    var outputNum: Double = 0
    var inputString: String = ""
    var outputString: String = ""
    var inputUnit: String = ""
    var outputUnit: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OutputDisplay.text = conversions[0].outputUnit
        InputDisplay.text = conversions[0].inputUnit
        
        outputUnit = conversions[0].outputUnit
        inputUnit = conversions[0].inputUnit
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Converter(_ sender: Any) {
        let menuOptions = UIAlertController(title: "Converter Menu", message: "Choose a converter of your choice!", preferredStyle:  UIAlertController.Style.actionSheet)
        
        for unitconverter in conversions {
            menuOptions.addAction(UIAlertAction(title: unitconverter.label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                self.inputNum = Double(self.inputString) ?? 0
                self.inputUnit = unitconverter.inputUnit
                self.outputUnit = unitconverter.outputUnit
                self.InputDisplay.text = unitconverter.inputUnit
                self.OutputDisplay.text = unitconverter.outputUnit
            }))
        }
        
        menuOptions.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(menuOptions, animated: true, completion: nil)
    }
    
    func makeInput(inputNum: Double, inputUnit: String) -> String {
        var inputString1 = String(inputNum)
        inputString1.append(inputUnit)
        return inputString1
    }
    
    func makeOutput(inputNum: Double, outputUnit: String) -> String {
        if inputUnit == "C°" {
            outputNum = inputNum * 9/5 + 32
        }
        else if inputUnit == "F°" {
            outputNum = (inputNum - 32) * 5/9
        }
        else if inputUnit == "km" {
            outputNum = inputNum / 1.6093
        }
        else if inputUnit == "mi" {
            outputNum = inputNum * 1.6093
        }
        else if inputUnit == "m" {
            outputNum = inputNum * 100
        }
        else if inputUnit == "cm" {
            outputNum = inputNum / 100
        }
        else if inputUnit == "km" {
            outputNum = inputNum * 1000
        }
        else if inputUnit == "kg" {
            outputNum = inputNum * 1000
        }
        else if inputUnit == "$" {
            outputNum = inputNum * 6.88190
        }
        else if inputUnit == "¥" {
            outputNum = inputNum * 0.15
        }
        
        outputNum = round(outputNum * 100) / 100
        
        var outputString1 = String(outputNum)
        outputString1.append(outputUnit)
        return outputString1
    }
    
    @IBAction func clearButton(_ sender: Any) {
        inputNum = 0
        inputString = ""
        outputString = ""
        self.InputDisplay.text = inputUnit
        self.OutputDisplay.text = outputUnit
    }
    
    @IBAction func signChangeButton(_ sender: Any) {
        inputNum *= 1
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number9Button(_ sender: Any) {
        inputString.append("9")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number8Button(_ sender: Any) {
        inputString.append("8")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number7Button(_ sender: Any) {
        inputString.append("7")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number6Button(_ sender: Any) {
        inputString.append("6")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number5Button(_ sender: Any) {
        inputString.append("5")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number4Button(_ sender: Any) {
        inputString.append("4")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number3Button(_ sender: Any) {
        inputString.append("3")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number2Button(_ sender: Any) {
        inputString.append("2")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number1Button(_ sender: Any) {
        inputString.append("1")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number0Button(_ sender: Any) {
        inputString.append("0")
        inputNum = Double(inputString) ?? 0
        self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func decimalButton(_ sender: Any) {
        if inputString.contains(".") {
            return
        }
        else {
            inputString.append(".")
            self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
            self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
        }
    }
    
    
    
    @IBAction func addButton(_ sender: Any) {
        InputDisplay.text = String(previousNumber + numberOnScreen)
    }
    
    @IBAction func subtractButton(_ sender: Any) {
        changeModes(newMode: .subtraction)
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        changeModes(newMode: .multiplication)
    }
    
    @IBAction func divideButton(_ sender: Any) {
        changeModes(newMode: .division)
    }
    
    @IBAction func equalButton(_ sender: Any) {
        let button = convertLabelTextToInt()
        
        if currentMode == .idle || previousButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            previousNumber += button
        }
        
        else if currentMode == .subtraction {
            previousNumber -= button
        }
        
        else if currentMode == .multiplication {
            previousNumber *= button
        }
        
        else if currentMode == .division {
            previousNumber /= button
        }
        
        currentMode = .idle
        textDisplay = "\(previousNumber)"
        textUpdate()
        previousButtonWasMode = true
    }
    
    func textUpdate() {
        let button = convertLabelTextToInt()
        
        if currentMode == .idle {
            previousNumber = button
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let number1 = NSNumber(value: button)
        
        textDisplay = "\(button)"
        OutputDisplay.text = formatter.string(from: number1)
        InputDisplay.text = formatter.string(from: number1)
    }
    
    func changeModes(newMode: operations) {
        if previousNumber == 0 {
            return
        }
        
        currentMode = newMode
        previousButtonWasMode = true
    }
    
    func convertLabelTextToInt() -> Int {
        guard let button: Int = Int(textDisplay) else {
            displayError()
            return -1
        }
        
        return button
    }
    
    func displayError() {
        OutputDisplay.text = "Error"
        InputDisplay.text = "Error"
    }
}

