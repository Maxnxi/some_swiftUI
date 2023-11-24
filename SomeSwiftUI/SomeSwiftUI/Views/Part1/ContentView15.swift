//
//  ContentView15.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView15: View {
    
    @State private var colors = [
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue",
        "Red", "Green", "Blue"
    ]
    @State private var selectedColor = 0
    @State private var additionalSettings = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(
                        selection: $selectedColor) {
                            ForEach(0..<colors.count) {
                                Text(self.colors[$0])
                            }
                            
                        } label: {
                            Text("Select a color")
                        }
                        .pickerStyle(.automatic)
                            //.navigationLink)
                            //.segmented)
                } header: {
                    Text("Colors")
                        .font(.title3)
                }
                
                Toggle(isOn: $additionalSettings) {
                    Text("Additional settings")
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Save changes")
                })
                .disabled(!additionalSettings)
                .navigationTitle("Settings")
            }
            .formStyle(.automatic)
        }
    }
}

#Preview {
    ContentView15()
}
