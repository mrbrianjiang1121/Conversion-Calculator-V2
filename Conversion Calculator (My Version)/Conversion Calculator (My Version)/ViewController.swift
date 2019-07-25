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
    let convertFrom: String
    let convertTo: String
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
    
    var conversions = [UnitConverter(label: TypeConverter.F_to_C.rawValue, convertFrom: "F°", convertTo: "C°"),
                       UnitConverter(label: TypeConverter.C_to_F.rawValue, convertFrom: "C°", convertTo: "F°"),
                        UnitConverter(label: TypeConverter.mi_to_km.rawValue, convertFrom: "mi", convertTo: "km"),
                        UnitConverter(label: TypeConverter.km_to_mi.rawValue, convertFrom: "km", convertTo: "mi"),
                        UnitConverter(label: TypeConverter.m_to_cm.rawValue, convertFrom: "m", convertTo: "cm"),
                        UnitConverter(label: TypeConverter.cm_to_m.rawValue, convertFrom: "cm", convertTo: "m"),
                        UnitConverter(label: TypeConverter.dol_to_chy.rawValue, convertFrom: "$", convertTo: "¥"),
                        UnitConverter(label: TypeConverter.chy_to_dol.rawValue, convertFrom: "¥", convertTo: "$")]
    
    var inputNum: Double = 0
    var outputNum: Double = 0
    var inputString: String = ""
    var outputString: String = ""
    var convertFrom: String = ""
    var convertTo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OutputDisplay.text = "0.0C°"
        InputDisplay.text = "0.0F°"
        
        convertTo = conversions[0].convertTo
        convertFrom = conversions[0].convertFrom
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Converter(_ sender: Any) {
        let menuOptions = UIAlertController(title: "Converter Menu", message: "Choose a converter of your choice!", preferredStyle:  UIAlertController.Style.actionSheet)
        
        for unitconverter in conversions {
            menuOptions.addAction(UIAlertAction(title: unitconverter.label, style: UIAlertAction.Style.default, handler: {
                (alertAction) -> Void in
                self.inputNum = Double(self.inputString) ?? 0
                self.convertFrom = unitconverter.convertFrom
                self.convertTo = unitconverter.convertTo
                self.InputDisplay.text = self.createInput(inputNum: self.inputNum, convertFrom: self.convertFrom)
                self.OutputDisplay.text = self.createOutput(inputNum: self.inputNum, convertTo: self.convertTo)
            }))
        }
        
        menuOptions.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(menuOptions, animated: true, completion: nil)
    }
    
    func createInput(inputNum: Double, convertFrom: String) -> String
    {
        var inputString1 = String(inputNum)
        inputString1.append(convertFrom)
        return inputString1
    }
    
    func createOutput(inputNum: Double, convertTo: String) -> String {
        if convertFrom == "C°"
        {
            outputNum = inputNum * 9/5 + 32
        }
        else if convertFrom == "F°"
        {
            outputNum = (inputNum - 32) * 5/9
        }
        else if convertFrom == "km"
        {
            outputNum = inputNum * 0.621371
        }
        else if convertFrom == "mi"
        {
            outputNum = inputNum * 1.60934
        }
        else if convertFrom == "m"
        {
            outputNum = inputNum * 100
        }
        else if convertFrom == "cm"
        {
            outputNum = inputNum / 100
        }
        else if convertFrom == "$"
        {
            outputNum = inputNum * 6.88190
        }
        else if convertFrom == "¥"
        {
            outputNum = inputNum * 0.15
        }
        else
        {
            print("Invalid input!")
        }
        
        outputNum = round(outputNum * 100) / 100
        
        var outputString1 = String(outputNum)
        outputString1.append(convertTo)
        return outputString1
    }
    
    @IBAction func clearButton(_ sender: Any) {
        inputNum = 0
        inputString = ""
        outputString = ""
        InputDisplay.text = convertFrom
        OutputDisplay.text = convertTo
    }
    
    @IBAction func signChangeButton(_ sender: Any)
    {
        inputNum *= -1
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number9Button(_ sender: Any)
    {
        inputString.append("9")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number8Button(_ sender: Any)
    {
        inputString.append("8")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number7Button(_ sender: Any)
    {
        inputString.append("7")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number6Button(_ sender: Any)
    {
        inputString.append("6")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number5Button(_ sender: Any)
    {
        inputString.append("5")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number4Button(_ sender: Any)
    {
        inputString.append("4")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number3Button(_ sender: Any)
    {
        inputString.append("3")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number2Button(_ sender: Any)
    {
        inputString.append("2")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number1Button(_ sender: Any)
    {
        inputString.append("1")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func number0Button(_ sender: Any)
    {
        inputString.append("0")
        inputNum = Double(inputString) ?? 0
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
    
    @IBAction func decimalButton(_ sender: Any)
    {
        inputString.append(".")
        InputDisplay.text = createInput(inputNum: inputNum, convertFrom: convertFrom)
        OutputDisplay.text = createOutput(inputNum: inputNum, convertTo: convertTo)
    }
}
