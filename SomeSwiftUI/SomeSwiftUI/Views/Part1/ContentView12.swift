//
//  ContentView12.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct MusicRow: View {
    var name: String
    var body: some View {
        Text("Music \(name)")
    }
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}

struct RestaurantRow: View {
    var restaurant: Restaurant
    var body: some View {
        Text("here is a \(restaurant.name) Restaurant")
    }
}

struct ContentView12: View {
    var body: some View {
        let firstRest = Restaurant(name: "Fish")
        let secondRest = Restaurant(name: "Meat")
        let restaurants = [firstRest, secondRest]
        
        return VStack {
            Text("Hello, World!")
            
            List {
                MusicRow(name: "Bass")
                MusicRow(name: "Drum")
                MusicRow(name: "Shifts")
                MusicRow(name: "Piano")
            }
            .listStyle(.plain)
            .padding()
            .background(.red)
            .frame(width: 300, height: 150)
            .padding()
            .background(Color.green)
            
            List(restaurants) { restaurant in
                RestaurantRow(restaurant: restaurant)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            List {
                Section {
                    MusicRow(name: "Bass")
                        .foregroundStyle(.white)
                    MusicRow(name: "Drum")
                        .foregroundStyle(.red)
                    MusicRow(name: "Shifts")
                        .font(.title)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .white, .green],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(
                            color: .black,
                            radius: 1,
                            x: 20,
                            y: 10)
                        
                    MusicRow(name: "Piano")
                } header: {
                    Text("Section #1")
                }
                .listRowInsets(.init(top: 20, leading: 70, bottom: 20, trailing: 10))
                .listRowBackground(Color.blue)
                .listRowSeparator(.hidden)
                .listItemTint(.white)
            }
            .listStyle(.insetGrouped)
            .clipShape(Capsule())
            .contentShape(Capsule())

        }
        .padding()
        .background(.yellow)

        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//        .background(.yellow)

    }
}

#Preview {
    ContentView12()
}
