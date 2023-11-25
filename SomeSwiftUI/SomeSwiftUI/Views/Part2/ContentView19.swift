//
//  ContentView19.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

/// NavigationLink
struct Dog: Identifiable {
    var id = UUID()
    var name: String
}

struct DogRow: View {
    var dog: Dog
    var body: some View {
        Text(dog.name)
    }
}

struct DogView: View {
    var dog: Dog
    var body: some View {
        Text("Come and choose a \(dog.name)")
    }
}
///


struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        let first = Dog(name: "Sobaka babaka")
        let second = Dog(name: "Labrador")
        let third = Dog(name: "Doberman")
        let fourth = Dog(name: "Pincher")

        let dogs = [first, second, third, fourth]
        
        return NavigationStack {
            Text("This is some View")
            List(dogs) { dog in
                NavigationLink {
                    DogView(dog: dog)
                } label: {
                    DogRow(dog: dog)
                }
            }
            .navigationTitle("Choose a dog")
            .toolbar {
                Button("Close") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct ContentView19: View {
    
    @State private var showingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Text("Show detail for Navigation Link")
                }
                .padding()
                
                Divider()
                    .padding()
                
                Button() {
                    self.showingSheet.toggle()
                } label: {
                    Text("Show detail for Sheet")
                }
                .sheet(isPresented: $showingSheet) {
                    DetailView()
                }
                .padding()
                
                .navigationTitle("Navigation")
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView19()
}
