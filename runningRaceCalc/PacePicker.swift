//
//  PacePicker.swift
//  runningRaceCalc
//
//  Created by Maxim Huckstepp on 1/2/23.
//

import SwiftUI

struct TimeOrPacePicker: View {
    @ObservedObject var pace: TimeInput
    var useTimeNotPace: Bool = false
    var label: String?

    func getRange() -> Range<Int> {
        if useTimeNotPace {
            return 0..<60
        }
        return 3..<25
    }

    var body: some View {
        HStack {
            if useTimeNotPace {
                CustomPicker(valueBinding: $pace.hours, range: 0..<15, label: "Pace")
                Text(":")
            }
            CustomPicker(
                valueBinding: $pace.minutes,
                range: getRange(),
                label: "Pace"
            )
            Text(":")
            CustomPicker(valueBinding: $pace.seconds, range: 0..<60)
            if let label {
                Text(label)
            }
        }
    }
}

