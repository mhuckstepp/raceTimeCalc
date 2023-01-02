//
//  RaceDetail.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/6/22.
//

import Foundation

let speedDiffs = 0.02
let totalSpeeds = 50

import SwiftUI

struct RaceTimeRowView: View {
    var currSpeed: Double
    var distance: Double

    var body: some View {
        HStack {
            Text(String(format: "%.2f", currSpeed)).frame(maxWidth: .infinity)
            Text(getPace(speed: currSpeed)).frame(maxWidth: .infinity)
            Text(convertDistanceAndSpeedToTime(distance: distance, speed: currSpeed )).frame(maxWidth: .infinity)
        }
    }
}

struct RaceDetail: View {
    @ObservedObject var speed: NumberInput
    var distance: Double
    
    func createSpeedArray(middleSpeed: Double) -> Array<String> {
        let lowestSpeed = middleSpeed - (Double(totalSpeeds) / 2) * speedDiffs
        var speeds: Array<String> = []
        for i in 0...totalSpeeds {
            speeds.append(String(lowestSpeed + Double(i) * speedDiffs))
        }
        return speeds
    }
    
    var body: some View {
        SpeedPicker(speed: speed)
        Section(header: HStack {
            Text("Speed (mph)").frame(maxWidth: .infinity)
            Text("Pace (min/mile)").frame(maxWidth: .infinity)
            Text("Time").frame(maxWidth: .infinity)
        }) {
            List(createSpeedArray(middleSpeed: speed.getFullNum()), id: \.self) { currSpeed in
                    RaceTimeRowView(currSpeed: Double(currSpeed)!, distance: distance)
                }
        }.navigationTitle(String(format: "%.1f", distance) + " Miles").toolbar(.hidden, for: .tabBar)
    }
}
