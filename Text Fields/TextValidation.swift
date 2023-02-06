//
//  TextFieldConfigurator.swift
//  Text Fields
//
//  Created by Dmytro Horodyskyi on 03.02.2023.
//

import Foundation

struct TextValidation {
    
    func removeDigits(from string: String) -> String{
        string.components(separatedBy: CharacterSet.decimalDigits).joined()
    }
    
    func transform(_ string: String, to mask: String) -> String{
        var changingString = string
        var result = String("")
        let mask = mask
        
        for symbol in mask {
            if changingString == "" {
                break
            }
            let firstChar = changingString[changingString.startIndex]
            
            if symbol == "w" && firstChar.isLetter {
                result += String(firstChar)
            } else if symbol == "d" && firstChar.isNumber {
                result += String(firstChar)
            } else if symbol == "-"{
                result += String(symbol)
            }
            changingString.removeFirst()
        }
        return result
    }
}
