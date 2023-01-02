//
//  SpeedPicker.swift
//  runningRaceCalc
//
//  Created by Maxim Huckstepp on 1/2/23.
//

import SwiftUI

struct SpeedPicker: View {
    @ObservedObject var speed: NumberInput
    
    var body: some View {
        HStack {
            CustomPicker(valueBinding: $speed.main, range: 1..<23, label: "Speed")
            Text(".")
            CustomPicker(valueBinding: $speed.decimal, range: 0..<100)
            Text("mph")
        }
    }
}
