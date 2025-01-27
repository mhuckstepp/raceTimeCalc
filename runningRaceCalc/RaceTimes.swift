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
    @ObservedObject var pace: TimeInput

    func createTimes(distances: Array<RaceObject>) -> Array<RaceResult> {
        let speedToUse = pace.getSpeed()
        guard (speedToUse != 0)  else { return [RaceResult(name: "N/A", time: "no speed given")] }
        return distances.map { race in
            let distance = race.distance
            let formattedDuration = convertDistanceAndSpeedToTime(distance: distance, speed: speedToUse)

            return RaceResult(name: race.name, time: formattedDuration)
        }
    }
    
    var body: some View {
        VStack {
            TimeOrPacePicker(pace: pace, label: "min/mile")
        Text("Speed = " + pace.getSpeedString() + " MPH").fontWeight(.bold)
            Text("Pace = " + pace.getPace()  + " Mins/Mile").fontWeight(.bold)
            ForEach(createTimes(distances: distances), id: \.self) { race in
                Text(race.name + " - " + race.time).padding()
                    }
                }
    }
}
