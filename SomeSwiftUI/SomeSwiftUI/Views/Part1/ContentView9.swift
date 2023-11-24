//
//  ContentView9.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView9: View {
    
    var colors = ["black", "white", "red", "green", "blue"]
    @State private var selectedColor: Int = 0
    
    var body: some View {
        VStack {
            //            @available(iOS 17, *)
            if #available(iOS 17.0, *) {
                Picker(
                    selection: $selectedColor,
                    label: Text("Choose a color")
                ) {
                    ForEach(0..<colors.count) { index in
                        Text(colors[index])
                    }
                }
                .pickerStyle(
                    .automatic
                    // .inline
                    // .menu
                    // .segmented
                    // .navigationLink
                    // .palette
                    // .wheel
                    // SegmentedPickerStyle()
                )
                .padding()
            }
            Text("you selected: \(colors[selectedColor])")
        }
    }
}

#Preview {
    ContentView9()
}
