//
//  RingView.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 28.11.2023.
//

import SwiftUI

struct RingView: View {
    
    var color1 = Color.red
    var color2 = Color.blue
    var width: CGFloat = 44.0
    var height: CGFloat = 44.0
    var percent: CGFloat = 78.0
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        
        return ZStack {
            // gray circle
            Circle()
                .stroke(
                    Color.black.opacity(0.1),
                    style: StrokeStyle(lineWidth: 5 * multiplier)
                )
                .frame(width: width, height: height)
            
            // progress circle
            Circle()
                .trim(
                    from: show ? progress : 1,
                    to: 1
                )
                .stroke(
                    LinearGradient(
                        gradient: 
                            Gradient(colors: [
                            color1,
                            color2
                            ]),
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading
                    ),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: .infinity,
                        dash: [20, 0],
                        dashPhase: 0
                    )
                )
                .rotationEffect(.degrees(90))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .frame(width: width, height: height)
                .shadow(
                    color: color2.opacity(0.1),
                    radius: 3 * multiplier,
                    x: 0,
                    y: 3 * multiplier
                )
            // Deprecated
//                .animation(
//                    .easeInOut
//                        .delay(0.4)
//                )
                .animation(
                    .easeInOut.delay(0.4).speed(0.2),
                    value: 1
                    
                )
            
            // percent progress Text
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

#Preview {
    RingView(show: .constant(true))
}
