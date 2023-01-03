//
//  SwiftUIView.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/29/22.
//

import SwiftUI

struct PresetRaceSection: View {
    var pace: TimeInput
    
    var body: some View {
        Text("Look at specific times for a race").padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        HStack {
            ForEach(0..<distancesMidPoint, id: \.self) { i in
                let currDistance = distances[i]
                NavigationLink(destination: RaceDetail(pace: pace, distance: currDistance.distance)) {
                    Text(currDistance.name).font(.system(size: 12.0))
                }.buttonStyle(.bordered)
                        }
            }
        HStack {
            ForEach(distancesMidPoint..<distances.count, id: \.self) { i in
                let currDistance = distances[i]
                NavigationLink(destination: RaceDetail(pace: pace, distance: currDistance.distance)) {
                    Text(currDistance.name).font(.system(size: 12.0))
                }.buttonStyle(.bordered)
                        }
        }.padding(.bottom)
        }
}
