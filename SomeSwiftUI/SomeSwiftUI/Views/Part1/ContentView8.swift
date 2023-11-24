//
//  ContentView8.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView8: View {
    
    @State private var celsius: Double = 0
    
    var body: some View {
        
        VStack {
            Slider(
                value: $celsius,
                in: -100...100,
                step: 0.1
            )
            .padding()
            Text("\(Int(celsius)) Celsiuis is \(Int(celsius * 9/5 + 32)) Fahrenheit ")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView8()
}
