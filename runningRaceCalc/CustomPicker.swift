//
//  CustomPicker.swift
//  runningRaceCalc
//
//  Created by Maxim Huckstepp on 1/2/23.
//

import SwiftUI

struct CustomPicker: View {
    @Binding var valueBinding : Int
    var range: Range<Int>
    var label: String = ""
    var body: some View {
        Picker(label, selection: $valueBinding){
            ForEach(range, id: \.self) { i in
                Text(String(format: "%02d", i)).tag(i)
            }
        }.pickerStyle(WheelPickerStyle()).frame(width: 50, height: 100)
    }
}
