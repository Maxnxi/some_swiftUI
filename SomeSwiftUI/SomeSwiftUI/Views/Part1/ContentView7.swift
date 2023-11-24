//
//  ContentView7.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 14/11/2566 BE.
//

import SwiftUI

struct ContentView7: View {
    
    @State private var name = ""
    @State private var password = ""
    @State private var isPasswordShown: Bool = false
    private var shownPassword: String {
        isPasswordShown ? password : hidenPassword
    }
    private var hidenPassword: String {
        String(repeatElement(
            "*",
            count: password.count
        ))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter name", text: $name)
                .textFieldStyle(
                    RoundedBorderTextFieldStyle()
                )
                .padding()
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerSize: CGSize(
                    width: 20,
                    height: 10
                )))
            ZStack {
//                Rectangle()
//                    .frame(height: 30)
//                    .foregroundColor(.clear)
//                    .background(Color.clear)
                HStack {
                    Spacer()
                    if name.count > 0 {
                        Text("Hello, \(name)")
                            .frame(alignment: .center)
//                            .background(Color.red)
                            .font(.title)
                    } else {
                        Text(" ")
                            .font(.title)
                    }
                    Spacer()
                }
            }
            SecureField("Enter password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerSize: CGSize(
                    width: 20,
                    height: 10
                )))
            
            Text("Your entered password: \(shownPassword) ")
            Toggle(isOn: $isPasswordShown) {
                Text("Show password")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView7()
}
