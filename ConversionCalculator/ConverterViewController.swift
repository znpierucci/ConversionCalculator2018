//
//  ConverterViewController.swift
//  ConversionCalculator
//
//  Created by Zachary Pierucci on 10/26/18.
//  Copyright © 2018 Zachary Pierucci. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var inputNumberString: String = ""
    var outputNumberString: String = ""
    var inputNumberDouble: Double = 0
    var outputNumberDouble: Double = 0
    var decimal: Bool = false
    var negative: Bool = false
    var conversionType = ActionSheet.ftoc

    let array = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"), Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"), Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"), Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    var currentConverter: Converter = Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentConverter = array[0]
        inputDisplay.text = array[0].inputUnit
        outputDisplay.text = array[0].outputUnit
        
    }
    
    @IBAction func converterButton(_ sender: UIButton) {

        let alert = UIAlertController(title: "Choose Converter", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[0]
            self.conversionType = ActionSheet.ftoc
            
            if (self.inputNumberDouble != 0) {
                self.addNumberFtoC("")
            }
            else {
                self.inputDisplay.text = "ºF"
                self.outputDisplay.text = "ºC"
            }
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[1]
            self.conversionType = ActionSheet.ctof
            
            if (self.inputNumberDouble != 0) {
                self.addNumberCtoF("")
            }
            else {
                self.inputDisplay.text = "ºC"
                self.outputDisplay.text = "ºF"
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[2]
            self.conversionType = ActionSheet.mtok
            
            if (self.inputNumberDouble != 0) {
                self.addNumberMtoK("")
            }
            else {
                self.inputDisplay.text = "mi"
                self.outputDisplay.text = "km"
            }
        }))
        
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[3]
            self.conversionType = ActionSheet.ktom
            
            if (self.inputNumberDouble != 0) {
                self.addNumberKtoM("")
            }
            else {
                self.inputDisplay.text = "km"
                self.outputDisplay.text = "mi"
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
    }
    
    func addNumberFtoC(_ num: String) {
        if (negative == false) {
            inputNumberString = inputNumberString + num
            inputDisplay.text = inputNumberString + " ºF"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)!
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = ((inputNumberDouble - 32) * (5/9))
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " ºC"
        } else {
            inputNumberString = inputNumberString + num
            inputDisplay.text = "-" + inputNumberString + " ºF"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)! * -1
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = ((inputNumberDouble - 32) * (5/9))
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " ºC"
        }
    }
    
    func addNumberCtoF(_ num: String) {
        if (negative == false) {
            inputNumberString = inputNumberString + num
            inputDisplay.text = inputNumberString + " ºC"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)!
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = ((inputNumberDouble * (9/5)) + (32))
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " ºF"
        } else {
            inputNumberString = inputNumberString + num
            inputDisplay.text = "-" + inputNumberString + " ºC"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)! * -1
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = ((inputNumberDouble * (9/5)) + (32))
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " ºF"
        }
    }
    
    func addNumberMtoK(_ num: String) {
        if (negative == false) {
            inputNumberString = inputNumberString + num
            inputDisplay.text = inputNumberString + " mi"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)!
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = (inputNumberDouble * 1.609)
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " km"
        } else {
            inputNumberString = inputNumberString + num
            inputDisplay.text = "-" + inputNumberString + " mi"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)! * -1
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = (inputNumberDouble * 1.609)
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " km"
        }
    }
    
    func addNumberKtoM(_ num: String) {
        if (negative == false) {
            inputNumberString = inputNumberString + num
            inputDisplay.text = inputNumberString + " km"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)!
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = (inputNumberDouble / 1.609)
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " mi"
        } else {
            inputNumberString = inputNumberString + num
            inputDisplay.text = "-" + inputNumberString + " km"
            if (inputNumberString != "") {
                inputNumberDouble = Double(inputNumberString)! * -1
            } else {
                inputNumberDouble = 0
            }
            outputNumberDouble = (inputNumberDouble / 1.609)
            outputNumberString = String(outputNumberDouble)
            outputDisplay.text = outputNumberString + " mi"
        }
    }
    
    func addDecimal() {
        if (decimal == false) {
            inputNumberString = inputNumberString + "."
            inputDisplay.text = inputNumberString
            decimal = true
        }
    }
    
    func clearIO() {
        inputNumberString = ""
        inputNumberDouble = 0
        outputNumberString = ""
        outputNumberDouble = 0
    }
    
    @IBAction func zero(_ sender: Any) {
        
        if (inputNumberDouble == 0) {
            //do nothing
        } else {
            switch conversionType {
            case .ftoc:
                addNumberFtoC("0")
            case .ctof:
                addNumberCtoF("0")
            case .mtok:
                addNumberMtoK("0")
            case .ktom:
                addNumberKtoM("0")
            }
        }
    }
    
    @IBAction func one(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("1")
        case .ctof:
            addNumberCtoF("1")
        case .mtok:
            addNumberMtoK("1")
        case .ktom:
            addNumberKtoM("1")
        }
    }
    
    @IBAction func two(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("2")
        case .ctof:
            addNumberCtoF("2")
        case .mtok:
            addNumberMtoK("2")
        case .ktom:
            addNumberKtoM("2")
        }
    }
    
    @IBAction func three(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("3")
        case .ctof:
            addNumberCtoF("3")
        case .mtok:
            addNumberMtoK("3")
        case .ktom:
            addNumberKtoM("3")
        }
    }
    
    @IBAction func four(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("4")
        case .ctof:
            addNumberCtoF("4")
        case .mtok:
            addNumberMtoK("4")
        case .ktom:
            addNumberKtoM("4")
        }
    }
    
    @IBAction func five(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("5")
        case .ctof:
            addNumberCtoF("5")
        case .mtok:
            addNumberMtoK("5")
        case .ktom:
            addNumberKtoM("5")
        }
    }
    
    @IBAction func six(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("6")
        case .ctof:
            addNumberCtoF("6")
        case .mtok:
            addNumberMtoK("6")
        case .ktom:
            addNumberKtoM("6")
        }
    }
    
    @IBAction func seven(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("7")
        case .ctof:
            addNumberCtoF("7")
        case .mtok:
            addNumberMtoK("7")
        case .ktom:
            addNumberKtoM("7")
        }
    }
    
    @IBAction func eight(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("8")
        case .ctof:
            addNumberCtoF("8")
        case .mtok:
            addNumberMtoK("8")
        case .ktom:
            addNumberKtoM("8")
        }
    }
    
    @IBAction func nine(_ sender: Any) {
        switch conversionType {
        case .ftoc:
            addNumberFtoC("9")
        case .ctof:
            addNumberCtoF("9")
        case .mtok:
            addNumberMtoK("9")
        case .ktom:
            addNumberKtoM("9")
        }
    }
    
    @IBAction func decimal(_ sender: Any) {
        addDecimal()
        switch conversionType {
        case .ftoc:
            if (negative == true) {
                inputDisplay.text = "-" + inputNumberString + " ºF"
            } else {
                inputDisplay.text = inputNumberString + " ºF"
            }
            outputDisplay.text = outputNumberString + " ºC"
        case .ctof:
            if (negative == true) {
                inputDisplay.text = "-" + inputNumberString + " ºC"
            } else {
                inputDisplay.text = inputNumberString + " ºC"
            }
            outputDisplay.text = outputNumberString + " ºF"
        case .mtok:
            if (negative == true) {
                inputDisplay.text = "-" + inputNumberString + " mi"
            } else {
                inputDisplay.text = inputNumberString + " mi"
            }
            outputDisplay.text = outputNumberString + " km"
        case .ktom:
            if (negative == true) {
                inputDisplay.text = "-" + inputNumberString + " km"
            } else {
                inputDisplay.text = inputNumberString + " km"
            }
            outputDisplay.text = outputNumberString + " mi"
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        clearIO()
        negative = false
        
        switch conversionType {
        case .ftoc:
            inputDisplay.text = "ºF"
            outputDisplay.text = "ºC"
        case .ctof:
            inputDisplay.text = "ºC"
            outputDisplay.text = "ºF"
        case .mtok:
            inputDisplay.text = "mi"
            outputDisplay.text = "km"
        case .ktom:
            inputDisplay.text = "km"
            outputDisplay.text = "mi"
        }
        
        decimal = false
    }
    
    
    @IBAction func plusMinus(_ sender: Any) {
        if (negative == false) {
            negative = true
            switch conversionType {
            case .ftoc:
                addNumberFtoC("")
            case .ctof:
                addNumberCtoF("")
            case .mtok:
                addNumberMtoK("")
            case .ktom:
                addNumberKtoM("")
            }
        } else {
            negative = false
            switch conversionType {
            case .ftoc:
                addNumberFtoC("")
            case .ctof:
                addNumberCtoF("")
            case .mtok:
                addNumberMtoK("")
            case .ktom:
                addNumberKtoM("")
            }
        }
    }
}
