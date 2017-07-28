//
//  CalculatorModel.swift
//  Final4001
//
//  Created by Taylor Snyder on 7/27/17.
//  Copyright © 2017 tsny inc. All rights reserved.
//

import Foundation

class CalculatorModel
{
    init()
    {
        self.conversion = .fahrenheitToCelcius
        self.inputValue = 0.0
        self.outputValue = 0.0
        self.inputHasDecimal = false
        self.isUserTyping = false
        self.inputString = ""
        self.convertedUnitString = ""
        self.baseUnitString = ""
    }
    
    enum conversionType
    {
        case fahrenheitToCelcius
        case celciusToFahrenheit
        case milesToKilometers
        case kilometersToMiles
        
        func getSuffix() -> (String, String)
        {
            switch self
            {
                case .fahrenheitToCelcius:
                    return (" °F", " °C")
                case .celciusToFahrenheit:
                    return (" °C", " °F")
                case .milesToKilometers:
                    return (" m", " km")
                case .kilometersToMiles:
                    return (" km", " m")
            }
        }
    }
    
    var isUserTyping: Bool
    var inputHasDecimal: Bool
    var conversion: conversionType
    var inputValue: Float
    var outputValue: Float
    var inputString: String?
    var baseUnitString: String?
    var convertedUnitString: String?
    
    func convertUnit(input: Float) -> Float
    {
        switch(conversion)
        {
            case .celciusToFahrenheit:
                return (input * 1.8) / 32

            case .fahrenheitToCelcius:
                return (input - 32) / 1.8
            
            case .kilometersToMiles:
                return input * 0.621371
            
            case .milesToKilometers:
                return input * 1.60934
        }
    }
    
    func newInput(input: String)
    {
        if(!isUserTyping && (input == "." || input == "0"))
        {
            return
        }
        
        if(inputHasDecimal && input == ".")
        {
            return
        }
        
        if(input == ".")
        {
            inputHasDecimal = true
        }
        
        isUserTyping = true
        
        inputString = inputString! + input
        
        inputValue = Float(inputString!)!
        outputValue = convertUnit(input: inputValue)
        
        baseUnitString = inputString! + conversion.getSuffix().0
        convertedUnitString = String(outputValue) + conversion.getSuffix().1
    }
    
    func negateInput()
    {
        inputValue = -inputValue
    }
    
    func clearInput()
    {
        isUserTyping = false
        inputHasDecimal = false
        inputValue = 0.0
        outputValue = 0.0
        inputString = ""
        baseUnitString = ""
        convertedUnitString = ""
    }
}
