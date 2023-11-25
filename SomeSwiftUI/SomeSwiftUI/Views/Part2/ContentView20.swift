//
//  ContentView20.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

enum User20Constant {
    static let userKeyInDefaults = "UserData"
}

struct User20: Codable {
    let firstName: String
}

struct ContentView20: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @State private var userName: String = ""
    private var name: String {
        userName.isEmpty ? "World" : userName
    }
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            
            Divider()
                .padding()
            
            Button("Tap count: \(tapCount)") {
                self.tapCount += 1
                UserDefaults.standard.set(
                    self.tapCount,
                    forKey: "Tap"
                )
            }
            
            Divider()
                .padding()
            
            TextField("Enter first Name", text: $userName)
                .textFieldStyle(.plain)
                .padding()
                .background(.green)
                .foregroundColor(.blue)
                
            
            Button("Save name") {
                if !userName.isEmpty {
                    let userInfo = User20(firstName: userName)
                    if let data = try? JSONEncoder().encode(userInfo) {
                        UserDefaults.standard.set(data, forKey: User20Constant.userKeyInDefaults)
                    }
                }
            }
        }
        .task {
            if let userInfoData = UserDefaults.standard.object(forKey: User20Constant.userKeyInDefaults) as? Data,
            let decodedUserInfo = try? JSONDecoder().decode(
                User20.self,
                from: userInfoData
            ) {
                userName = decodedUserInfo.firstName
            }
        }
    }
}

#Preview {
    ContentView20()
}
