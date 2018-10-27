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
            self.inputDisplay.text = self.array[0].inputUnit
            self.outputDisplay.text = self.array[0].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[1]
            self.inputDisplay.text = self.array[1].inputUnit
            self.outputDisplay.text = self.array[1].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[2]
            self.inputDisplay.text = self.array[2].inputUnit
            self.outputDisplay.text = self.array[2].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: .default , handler:{ (UIAlertAction)in
            self.currentConverter = self.array[3]
            self.inputDisplay.text = self.array[3].inputUnit
            self.outputDisplay.text = self.array[3].outputUnit
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
    }
}
