//
//  MeterView.swift
//  SacresBleus
//
//  Created by Eric Chandonnet on 2024-03-12.
//

import SwiftUI

enum MeterType {
    case profanity
    case frequency
}

struct MeterView: View {
    var type: MeterType
    var level: Double
    
    var body: some View {
        VStack {
            switch type {
            case .profanity:
                Text("Profanity")
                    .fontWeight(.bold)

            case .frequency:
                Text("Frequency")
                    .fontWeight(.bold)
            }
            Gauge(value: level, in: 0...10) {
                Text("0-10")
            } currentValueLabel: {
                Text((floor(level * 10) / 10.0).formatted())
                    .fontWeight(.heavy)
            }
            //        .tint(.red)
            //        .shadow(color: .red.opacity(0.3), radius: 3)
            .gaugeStyle(.accessoryCircularCapacity)
            //        .foregroundStyle(.red)

        }

    }
}

#Preview {
    MeterView(type: .profanity, level: 8)
}
