//
//  ContentView.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/5/22.
//ew


import SwiftUI

struct ContentView: View {
    @StateObject private var speed = NumberInput(main: 7, decimal: 50, baseForDecimal: 100)
    @StateObject private var pace = TimeInput(minutes: 8, seconds: 0)
    @State private var showPace = 0


    var body: some View {
        NavigationView {
            VStack {
                Picker("Select picker style", selection: $showPace) {
                    Text("Pace").tag(0)
                    Text("Speed").tag(1)
                }.pickerStyle(.segmented).padding(.horizontal).padding(.bottom, 30)
                if showPace == 0  {
                    CustomText(text: "Calulate your speed based on pace")
                    PacePicker(pace: pace, label: "min/mile")
                    Text("Speed = " + String(pace.getSpeedString()) + " MPH")
                } else {
                    Group {
                        CustomText(text: "Calulate your pace based on speed")
                        SpeedPicker(speed: speed)
                        Text("Pace = " + getPace(speed: speed.getFullNum()) + " mins/mile")
                    }
                }
                NavigationLink(destination: RaceTimes(pace: pace)) {
                    Text("Check All Race Times Based on Speed")
                }.buttonStyle(.borderedProminent)
                Divider().padding(.top)
                PresetRaceSection(pace: pace)
                Divider().padding(.bottom)
                NavigationLink(destination: PredictRaceTimesView()) {
                    Text("Predict Race Times")
                }.padding(10).background(Color.orange).cornerRadius(5).foregroundColor(Color.black)
                Spacer()
            }
        }
    }
}
