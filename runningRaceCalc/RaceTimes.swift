//
//  Marathon Chart.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/5/22.
//

import SwiftUI

struct RaceResult: Hashable {
   var name: String
   var time: String
}

struct RaceTimes: View {
    @ObservedObject var speed: NumberInput

    func createTimes(distances: Array<RaceObject>) -> Array<RaceResult> {
        let speedToUse = speed.getFullNum()
        guard (speedToUse != 0)  else { return [RaceResult(name: "N/A", time: "no speed given")] }
        return distances.map { race in
            let distance = race.distance
            let formattedDuration = convertDistanceAndSpeedToTime(distance: distance, speed: speedToUse)

            return RaceResult(name: race.name, time: formattedDuration)
        }
    }
    
    var body: some View {
        VStack {
            SpeedPicker(speed: speed)
        Text("Speed = " + String(speed.getFullNum()) + " MPH").fontWeight(.bold)
            Text("Pace = " + getPace(speed: speed.getFullNum())  + " Mins/Mile").fontWeight(.bold)
            ForEach(createTimes(distances: distances), id: \.self) { race in
                Text(race.name + " - " + race.time).padding()
                    }
                }
    }
}
