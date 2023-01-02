//
//  SwiftUIView.swift
//  appDevMod4
//
//  Created by Maxim Huckstepp on 12/29/22.
//

import SwiftUI

struct PresetRaceSection: View {
    var speed: NumberInput
    
    var body: some View {
        Text("Look at specific times for a race").padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        HStack {
            ForEach(distances,  id: \.self) { race in
                NavigationLink(destination: RaceDetail(speed: speed, distance: race.distance)) {
                    Text(race.name).font(.system(size: 12.0))
                }
            }
        }
    }
}
