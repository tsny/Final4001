//
//  CalculatorVC.swift
//  Final4001
//
//  Created by Taylor Snyder on 7/27/17.
//  Copyright © 2017 tsny inc. All rights reserved.
//

import Foundation
import UIKit

class CalculatorVC: UIViewController
{
    
    @IBOutlet weak var convertedUnit: UITextField!
    @IBOutlet weak var baseUnit: UITextField!
    
    var calcModel = CalculatorModel()
    
    
    @IBAction func touchDigit(_ sender: Any)
    {
        let sender = sender as! UIButton
        
        if(!calcModel.isUserTyping && (sender.titleLabel?.text == "." || sender.titleLabel?.text == "0"))
        {
            return
        }
        
        if(calcModel.inputHasDecimal && sender.titleLabel?.text == ".")
        {
            return
        }
        
        if(sender.titleLabel?.text == ".")
        {
            calcModel.inputHasDecimal = true
        }
        
        calcModel.isUserTyping = true
        
        calcModel.inputString = calcModel.inputString! + (sender.titleLabel?.text)!
        
        baseUnit.text = calcModel.inputString! + calcModel.currentConversion.getSuffix().0
        convertedUnit.text = calcModel.outputString! + calcModel.currentConversion.getSuffix().1
    }
    
    @IBAction func negateInput(_ sender: Any)
    {
        if(calcModel.isUserTyping)
        {
            if(calcModel.inputString?.characters.first == "-")
            {
                let startIndex = calcModel.inputString?.startIndex
                let secondIndex = calcModel.inputString?.characters.index(after: startIndex!)
                calcModel.inputString = calcModel.inputString?.substring(from: secondIndex!)
            }
            else
            {
                calcModel.inputString = "-" + calcModel.inputString!
            }
        }
    }
    
    @IBAction func clearInput(_ sender: Any)
    {
        convertedUnit.text = ""
        baseUnit.text = ""
        calcModel.inputString = ""
        calcModel.isUserTyping = false
        calcModel.inputHasDecimal = false
    }
    
    @IBAction func changeConversion(_ sender: Any)
    {
        let alert = UIAlertController(title: "Conversions", message: "Choose conversion", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.currentConversion = .fahrenheitToCelcius
            self.clearInput((Any).self)

        }))
        
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.currentConversion = .celciusToFahrenheit
            self.clearInput((Any).self)

        }))
        
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.currentConversion = .milesToKilometers
            self.clearInput((Any).self)
        }))
        
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.currentConversion = .kilometersToMiles
            self.clearInput((Any).self)

        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel))
        
        self.present(alert, animated: true, completion: nil)
    }
}
