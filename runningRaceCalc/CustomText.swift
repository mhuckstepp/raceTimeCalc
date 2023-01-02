//
//  CustomText.swift
//  runningRaceCalc
//
//  Created by Maxim Huckstepp on 1/2/23.
//

import SwiftUI

struct CustomText: View {
    var text: String
    var body: some View {
        Text(text).padding(.vertical).font(.system(size: 22.0)).bold().multilineTextAlignment(.center)
    }
}
