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
        
        calcModel.newInput(input: (sender.titleLabel?.text)!)
        refreshTextFields()
    }
    
    @IBAction func negateInput(_ sender: Any)
    {
        calcModel.negateInput()
        refreshTextFields()
    }
    
    @IBAction func clearInput(_ sender: Any)
    {
        calcModel.clearInput()
        refreshTextFields()
    }
    
    @IBAction func changeConversion(_ sender: Any)
    {
        let alert = UIAlertController(title: "Conversions", message: "Choose conversion", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.conversion = .fahrenheitToCelcius
            self.clearInput((Any).self)
        }))
        
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.conversion = .celciusToFahrenheit
            self.clearInput((Any).self)
        }))
        
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.conversion = .milesToKilometers
            self.clearInput((Any).self)
        }))
        
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: { (alertAction) in
            self.calcModel.conversion = .kilometersToMiles
            self.clearInput((Any).self)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func refreshTextFields()
    {
        baseUnit.text = calcModel.baseUnitString
        convertedUnit.text = calcModel.convertedUnitString
    }
}
