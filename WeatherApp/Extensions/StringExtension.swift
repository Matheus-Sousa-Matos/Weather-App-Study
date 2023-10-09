//
//  StringExtension.swift
//  WeatherApp
//
//  Created by Matheus de Sousa Matos on 28/09/23.
//

import Foundation

extension String {
    func capitalizeFirstLetterOfEachSentence() -> String {
        var result = ""
        var capitalizeNext = true
        
        for char in self {
            if char == "." || char == "!" || char == "?" {
                capitalizeNext = true
            } else if char != " " {
                if capitalizeNext {
                    result.append(char.uppercased())
                    capitalizeNext = false
                } else {
                    result.append(char.lowercased())
                }
            } else {
                result.append(char)
            }
        }
        
        return result
    }
}
