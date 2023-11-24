//
//  ContentView17.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .foregroundStyle(.white)
            .background(
                LinearGradient(
                    colors:
                        [
                            Color.black,
                            Color.white
                        ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .padding()
            .background(.yellow)
    }
}

struct CustomText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.title)
            .padding()
            .foregroundStyle(.red)
            .background(Color.green)
    }
}

extension View {
    func customM() -> some View {
        self.modifier(CustomModifier())
    }
}

struct ContentView17: View {
    
    @State private var useGreenText = false
    
    var body: some View {
        VStack {
            Button("Hello") {
                self.useGreenText.toggle()
            }
            .font(.title)
            .foregroundStyle(useGreenText ? .green : .blue)
            
            CustomText(name: "First")
            
            CustomText(name: "Second")
            
            Text("Custom Modifier")
                .modifier(CustomModifier())
            
            Text("Custom M")
                .customM()
        }
    }
}

#Preview {
    ContentView17()
}
