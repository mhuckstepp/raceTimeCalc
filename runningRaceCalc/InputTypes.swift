//
//  InputTypes.swift
//  runningRaceCalc
//
//  Created by Maxim Huckstepp on 1/2/23.
//

import Foundation


class NumberInput : ObservableObject {
    @Published var main: Int
    @Published var decimal: Int
    var baseForDecimal: Double
    
    func getFullNum() -> Double {
        return Double(main) + (Double(decimal) / baseForDecimal)
    }
    
    init(main: Int = 0, decimal: Int = 0, baseForDecimal: Double = 100) {
        self.main = main
        self.decimal = decimal
        self.baseForDecimal = baseForDecimal
    }
}

class TimeInput : ObservableObject {
    @Published var hours: Int
    @Published var minutes: Int
    @Published var seconds: Int
    
    func getMinutes() -> Double {
        return Double(hours) * 60 + Double(minutes) + Double(seconds) / 60
    }
    
    init(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}
