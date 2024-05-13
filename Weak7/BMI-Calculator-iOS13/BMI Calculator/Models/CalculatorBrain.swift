//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 이수현 on 5/11/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
//        if bmiValue != nil {
//            return String(format: "%.1f", bmiValue!)
//        } else {
//            return "0.0"
//        }
        
//        if let safeBMI = bmiValue {
//            return String(format: "%.1f", safeBMI)
//        } else {
//            return "0.0"
//        }
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = (weight / pow(height, 2))
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fir as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat fewer pies!", color: .red)
        }
    }
    
    func getAdvice() -> String {
        let bmiAdvice = bmi?.advice ?? ""
        return bmiAdvice
    }
    
    func getColor() -> UIColor {
        let bmiColor = bmi?.color ?? .black
        return bmiColor
    }
}
