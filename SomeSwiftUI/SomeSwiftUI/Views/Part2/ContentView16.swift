//
//  ContentView16.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView16: View {
    
    @State private var showingAlert = false
    
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    @State private var showingActionSheet = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
            
            Divider()
                .padding()
            
            Button("Show Alert") {
                self.showingAlert = true
            }
            .padding()
            .alert(
                "Hello SwiftUI !",
                isPresented: $showingAlert,
                actions: {
                    Text("do smth ")
                }) {
                    Text("Some more detail")
                }
            
            Divider()
                .padding()
            
            HStack {
                Button("Show Alert 1") {
                    self.showingAlert1 = true
                }
                .alert(
                    "Hello SwiftUI 1 !",
                    isPresented: $showingAlert1,
                    actions: {
                        Text("do smth 1")
                    }) {
                        Text("Some more detail 1")
                    }
                
                Divider()
                    .padding()
                
                Button("Show Alert 2") {
                    self.showingAlert2 = true
                }
                .alert(
                    "Hello SwiftUI 2 !",
                    isPresented: $showingAlert2,
                    actions: {
                        Text("do smth 2")
                    }) {
                        Text("Some more detail 2")
                    }
            }
            .frame(height: 50)
            
            Divider()
                .padding()
            
            Button("Show Alert 3") {
                self.showingAlert3 = true
            }
            .padding()
            .alert("Important message", isPresented: $showingAlert3) {
                Button("OK", role: .cancel) { }
                Button("OK 2", role: .destructive) { }
                Button("OK 3", role: .some(ButtonRole.cancel)) { }

            }
            
            Divider()
                .padding()
            
            Button("Show ActionSheet") {
                self.showingActionSheet = true
            }
            .padding()
            .confirmationDialog(
                "Action sheet",
                isPresented: $showingActionSheet) {
                    Button("OK 10") { }
                    Button("OK 11") { }
                    Button("OK 12") { }
                    Button("OK 2", role: .destructive) { }
                    Button("OK 3", role: .some(ButtonRole.cancel)) { }
                }
            
        }
    }
}

#Preview {
    ContentView16()
}
