//
//  ContentView10.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView10: View {
    
    @State private var age = 0
    
    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Your age is \(age)")
        }
        .padding()
        
        
        Stepper(
            "Stepper type 2 :",
            onIncrement: {
                self.age += 1
            },
            onDecrement: {
                self.age -= 1
            })
        .padding()
    }
}

#Preview {
    ContentView10()
}
