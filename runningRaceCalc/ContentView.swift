//
//  ContentView.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/5/22.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var speed = NumberInput(main: 7, decimal: 50, baseForDecimal: 100)
    @StateObject private var pace = TimeInput(minutes: 8, seconds: 0)
    @State private var showSpeedNotPace = 0

    func transformInputsToPace(paceMinutes: Int, paceSeconds: Int) -> Double {
        return Double(paceMinutes) + Double(paceSeconds) / 60
    }
        
    func getSpeed(pace: Double) -> String {
        if(pace == 0) { return "--" }
        return String(format: "%.2f", 60 / Double(pace))
    }
    
    func hideNavTab() -> Void {
        print("called HIDE")
        UITabBar.appearance().isHidden = true
    }

    func showNavTab() -> Void {
        print("called SHOW")
        UITabBar.appearance().isHidden = false
    }

    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select picker style", selection: $showSpeedNotPace) {
                    Text("Speed").tag(0)
                    Text("Pace").tag(1)
                }.pickerStyle(.segmented).padding(.horizontal).padding(.bottom, 60)
                if showSpeedNotPace != 0  {
                    CustomText(text: "Calulate your speed based on pace")
                    PacePicker(pace: pace, label: "min/mile")
                    Text("Speed = " + getSpeed(pace: pace.getMinutes()) + " MPH")
                } else {
                    Group {
                        CustomText(text: "Calulate your pace based on speed")
                        SpeedPicker(speed: speed)
                        Text("Pace = " + getPace(speed: speed.getFullNum()) + " mins/mile")
                    }
                }
                NavigationLink(destination: RaceTimes(speed: speed)) {
                    Text("Check All Race Times based on Speed")
                }.buttonStyle(.borderedProminent)
                PresetRaceSection(speed: speed)
                NavigationLink(destination: PredictRaceTimesView()) {
                    Text("Predict Race Times")
                }.buttonStyle(.bordered)
                Spacer()
            }
        }
    }
}
