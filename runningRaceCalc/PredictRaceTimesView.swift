//
//  PredictRaceTimes.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/29/22.
//

import SwiftUI

func stringToNum(possNum: String) -> Double {
    return Double(possNum) ?? 0
}

struct PredictRaceTimesView: View {
    @StateObject private var timeToComplete = TimeInput()
    @State private var knownDistance: String = "0"
    @FocusState private var distanceIsFocused: Bool

    
    func predictTime(distanceToPredict: Double) -> String {
        return convertTimeInMinutesToString(timeInMinutes: timeToComplete.getMinutes() * pow(distanceToPredict / stringToNum(possNum: knownDistance), 1.06))
    }
    
    func setDistance(distanceToSet: Double) {
        self.knownDistance = String(distanceToSet)
        distanceIsFocused = false
    }
    
    
    var body: some View {
        VStack {
            Text("Known/Existing Time").font(.callout)
                Text("(Hours : Mins : Seconds)")
            PacePicker(pace: timeToComplete, showHours: true)
            VStack{
                Text("Distance (miles)")
                HStack {
                    TextField("Distance", text: $knownDistance).keyboardType(.numberPad).frame(width: 120).textFieldStyle(.roundedBorder).focused($distanceIsFocused).multilineTextAlignment(.center)
                    Button("Submit", action: {
                        distanceIsFocused = false
                    })
                }
            }
            Text("Set Distance").padding(.top)
                HStack {
                    ForEach(0..<distancesMidPoint,  id: \.self) { i in
                        let race = distances[i]
                        Button(action: { setDistance(distanceToSet: race.distance) }) {
                            Text(race.name).font(.system(size: 12.0))
                        }.buttonStyle(.bordered)
                    }
                }
                HStack {
                    ForEach(distancesMidPoint..<distances.count,  id: \.self) { i in
                        let race = distances[i]
                        Button(action: { setDistance(distanceToSet: race.distance) }) {
                            Text(race.name).font(.system(size: 12.0))
                        }.buttonStyle(.bordered)
                    }
                }
            List(distances, id: \.self) { race in
                HStack {
                    Text("Predicted Time for \(race.name):")
                    Text(predictTime(distanceToPredict: race.distance)).frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}
