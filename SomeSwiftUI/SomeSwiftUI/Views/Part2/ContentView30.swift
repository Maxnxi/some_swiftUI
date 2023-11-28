//
//  ContentView30.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 28.11.2023.
//

import SwiftUI

struct ContentView30: View {
    @State var show: Bool = false
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Hello, World!")

            RingView(show: $show)
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                show.toggle()
            }
        }
    }
}

#Preview {
    ContentView30()
}
