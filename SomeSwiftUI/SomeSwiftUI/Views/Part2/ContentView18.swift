//
//  ContentView18.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//https://betterprogramming.pub/ios-17-observable-and-the-observation-framework-152deaf8fc5e
//https://developer.apple.com/documentation/observation

import SwiftUI
import Observation


struct User1 {
    var firstName = "Ivan"
    var lastName = "Petrov"
}

class UserClass2: ObservableObject {
    @Published var firstName = "Ivan"
    @Published var lastName = "Petrov"
}

@Observable
class UserClass3 {
    var firstName = "Ivan"
    var lastName = "Petrov"
}

struct NameForm: View {
    @State var user: UserClass3
    
    var body: some View {
        
        VStack {
            Text("class Example #3 - @Observable")
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
                .textFieldStyle(.roundedBorder)
            TextField("Last name", text: $user.lastName)
                .textFieldStyle(.roundedBorder)
        }
        .background(Color.red)
        
        Divider()
            .padding()
    }
}

struct ContentView18: View {
    
    @State private var user1 = User1()
    @ObservedObject private var user2 = UserClass2()
    
    private var user3 = UserClass3()

    
    var body: some View {
        VStack {
            VStack {
                Text("Struct Example")
                Text("Your name is \(user1.firstName) \(user1.lastName)")
                TextField("First name", text: $user1.firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last name", text: $user1.lastName)
                    .textFieldStyle(.roundedBorder)
            }
            .background(Color.blue)
            
            Divider()
                .padding()
            
            VStack {
                Text("class Example")
                Text("Your name is \(user2.firstName) \(user2.lastName)")
                TextField("First name", text: $user2.firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last name", text: $user2.lastName)
                    .textFieldStyle(.roundedBorder)
            }
            .background(Color.red)
            
            Divider()
                .padding()
            
            NameForm(user: UserClass3())
            
        }
        .padding()
    }
}




#Preview {
    ContentView18()
}
