//
//  ContentViewEx2.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentViewEx2: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.red,
                    Color.blue
                ]),
                startPoint: .top,
                endPoint: .trailing)
        }
        .ignoresSafeArea()

    }
}

#Preview {
    ContentViewEx2()
}
