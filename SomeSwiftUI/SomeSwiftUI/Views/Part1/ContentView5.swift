//
//  ContentView5.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 14/11/2566 BE.
//

import SwiftUI

struct ContentView5: View {
    
    @State private var showHello = true
    
    var body: some View {
        VStack {
            Toggle(
                isOn: $showHello,
                label: {
                    Text("Show hello")
                }
            )
            .padding()
            if showHello {
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    ContentView5()
}
