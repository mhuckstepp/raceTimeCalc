//
//  Helpers.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/6/22.
//

import Foundation

struct RaceObject: Hashable {
   var distance: Double
   var name: String
}

let distances: [RaceObject] = [RaceObject(distance: 1, name: "1M"), RaceObject(distance: 3.10686, name: "5K"), RaceObject(distance: 6.21371, name: "10K") , RaceObject(distance:10, name: "10M"), RaceObject(distance: 13.1094, name: "Hlf Marathon"), RaceObject(distance:20, name: "20M"),  RaceObject(distance:26.2187575, name: "Marathon"),  RaceObject(distance:50, name: "50M")]

func getPace(speed: Double) -> String {
    if(speed == 0 ) { return "--:--"  }
    let timeinMinutes: TimeInterval = TimeInterval(60 / Double(speed))
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: timeinMinutes * 60)!
}

func convertDistanceAndSpeedToTime(distance: Double, speed: Double) -> String {
    let timeInHours: TimeInterval = Double(distance) / Double(speed)
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: timeInHours * 60 * 60)!
}

func convertTimeInMinutesToString(timeInMinutes: Double) -> String {
    guard (!timeInMinutes.isNaN && !timeInMinutes.isInfinite && timeInMinutes != 0 )  else { return "-----"}
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: timeInMinutes * 60)!
}
