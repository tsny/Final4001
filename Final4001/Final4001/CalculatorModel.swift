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
        self.currentConversion = .fahrenheitToCelcius
        self.currentInput = 0.0
        self.inputHasDecimal = false
        self.isUserTyping = false
        self.inputString = ""
        self.outputString = ""
    }
    
    enum conversion
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
    var currentConversion: conversion
    var currentInput: Float
    var inputString: String?
    {
        didSet
        {
            if(inputString != "")
            {
                outputString = String(convertUnit(input: Float(inputString!)!))
            }
        }
    }
    var outputString: String?
    
    func convertUnit(input: Float) -> Float
    {
        switch(currentConversion)
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
   
}
