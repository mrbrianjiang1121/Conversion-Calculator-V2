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

enum TypeConverter: String {
    case F_to_C = "Fahrenheit to Celsius"
    case C_to_F = "Celsius to Fahrenheit"
    case km_to_mi = "Kilometers to Miles"
    case mi_to_km = "Miles to Kilometers"
    case m_to_cm = "Meters to Centimeters"
    case cm_to_m = "Centimeters to Meters"
    case dol_to_chy = "US Dollars to Chinese Yuan"
    case chy_to_dol = "Chinese Yuan to US Dollars"
}

class ConversionCalculatorViewController: UIViewController {
    @IBOutlet weak var OutputDisplay: UITextField!
    @IBOutlet weak var InputDisplay: UITextField!
    
    var currentConverter: UnitConverter = UnitConverter(label: TypeConverter.F_to_C.rawValue, inputUnit: "0.0 F°", outputUnit: "0.0 C°")
    
    var conversions = [UnitConverter(label: TypeConverter.F_to_C.rawValue, inputUnit: "F°", outputUnit: "C°"),
                       UnitConverter(label: TypeConverter.C_to_F.rawValue, inputUnit: "C°", outputUnit: "F°"),
                        UnitConverter(label: TypeConverter.mi_to_km.rawValue, inputUnit: "mi", outputUnit: "km"),
                        UnitConverter(label: TypeConverter.km_to_mi.rawValue, inputUnit: "km", outputUnit: "mi"),
                        UnitConverter(label: TypeConverter.m_to_cm.rawValue, inputUnit: "m", outputUnit: "cm"),
                        UnitConverter(label: TypeConverter.cm_to_m.rawValue, inputUnit: "cm", outputUnit: "m"),
                        UnitConverter(label: TypeConverter.dol_to_chy.rawValue, inputUnit: "$", outputUnit: "¥"),
                        UnitConverter(label: TypeConverter.chy_to_dol.rawValue, inputUnit: "¥", outputUnit: "$")]
    
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
        InputDisplay.text = "\(currentConverter.inputUnit)"
        OutputDisplay.text = "\(currentConverter.outputUnit)"
    }
    
    @IBAction func signChangeButton(_ sender: Any) {
        inputNum *= -1
        InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
    }
    
    @IBAction func number9Button(_ sender: Any) {
        inputString.append("9")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
        OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
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
            inputString.append(".")
            self.InputDisplay.text = makeInput(inputNum: inputNum, inputUnit: inputUnit)
            self.OutputDisplay.text = makeOutput(inputNum: inputNum, outputUnit: outputUnit)
        }
    }
