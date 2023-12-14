//
//  ContentView31.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 12.12.2023.
//

import SwiftUI

struct ContentView31: View {
    var body: some View {
        VStack {
            Text(
                LocalizedStringKey("Welcome")
            )
                .font(.title)
        }
        .padding()
    }
}
#Preview {
    ContentView31()
        .environment(\.locale, .init(identifier: "de"))
}
