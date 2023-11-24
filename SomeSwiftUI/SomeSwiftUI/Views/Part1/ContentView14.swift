//
//  ContentView14.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView14: View {
    
    @State private var selectedView = 1
    
    var body: some View {
        TabView {
            VStack {
                Text("Hello, World!")
                Text("First View")
                    .font(.title)
            }
            .tabItem {
                Image(systemName: "1.circle")
                    .foregroundStyle(.green)
                Text("First")
                    .font(.title)
            }
            .tag(1)
            
            VStack {
//                List {
                Text("1 SecondView")
                Text("2 SecondView")
                Text("3 SecondView")
                Text("4 SecondView")
                Text("5 SecondView")
                Text("6 SecondView")
                Text("7 SecondView")
                Text("8 SecondView")
                Text("9 SecondView")
                Text("10 SecondView")
                Text("11 SecondView")
                Text("12 SecondView")
                Text("13 SecondView")
                Text("14 SecondView")
                Text("15 SecondView")
                Text("16 SecondView")
                Text("17 SecondView")
                Text("18 SecondView")
                Text("19 SecondView")
                Text("20 SecondView")
                
                Text("1 SecondView")
                Text("2 SecondView")
                Text("3 SecondView")
                Text("4 SecondView")
                Text("5 SecondView")
                Text("6 SecondView")
                Text("7 SecondView")
                Text("8 SecondView")
                Text("9 SecondView")
                Text("10 SecondView")
                Text("11 SecondView")
                Text("12 SecondView")
                Text("13 SecondView")
                Text("14 SecondView")
                Text("15 SecondView")
                Text("16 SecondView")
                Text("17 SecondView")
                Text("18 SecondView")
                Text("19 SecondView")
                Text("20 SecondView")
                
                Text("1 SecondView")
                Text("2 SecondView")
                Text("3 SecondView")
                Text("4 SecondView")
                Text("5 SecondView")
                Text("6 SecondView")
                Text("7 SecondView")
                Text("8 SecondView")
                Text("9 SecondView")
                Text("10 SecondView")
                Text("11 SecondView")
                Text("12 SecondView")
                Text("13 SecondView")
                Text("14 SecondView")
                Text("15 SecondView")
                Text("16 SecondView")
                Text("17 SecondView")
                Text("18 SecondView")
                Text("19 SecondView")
                Text("20 SecondView")
                
                Text("1 SecondView")
                Text("2 SecondView")
                Text("3 SecondView")
                Text("4 SecondView")
                Text("5 SecondView")
                Text("6 SecondView")
                Text("7 SecondView")
                Text("8 SecondView")
                Text("9 SecondView")
                Text("10 SecondView")
                Text("11 SecondView")
                Text("12 SecondView")
                Text("13 SecondView")
                Text("14 SecondView")
                Text("15 SecondView")
                Text("16 SecondView")
                Text("17 SecondView")
                Text("18 SecondView")
                Text("19 SecondView")
                Text("20 SecondView")
                
//                }
            }
            .tabItem {
                Image(systemName: "cloud.fill")
                    .foregroundStyle(.green)
                Text("2nd - cloud")
                    .font(.title)
            }
            .tag(2)
        }
    }
}

#Preview {
    ContentView14()
}
