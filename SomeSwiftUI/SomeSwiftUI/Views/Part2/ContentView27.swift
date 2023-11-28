//
//  ContentView27.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 28.11.2023.
//

import SwiftUI

struct ContentView27: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello, World!")
            Image(systemName: "apple.logo")
                .resizable()
                .frame(width: 300,  height: 300)
                .aspectRatio(contentMode: .fit)
                .background(Color.blue)
                .cornerRadius(20)
                .padding()
                .contextMenu(ContextMenu(menuItems: {
                    // Button 1
                    Button(action: {
                        print("Copy")
                    }, label: {
                        HStack {
                            Image(systemName: "doc.on.doc")
                            Text("Copy button")
                        }
                    })
                    
                    // Button 2
                    Button(action: {
                        print("Copy")
                    }, label: {
                        HStack {
                            Image(systemName: "doc.on.doc")
                            Text("Copy button")
                        }
                    })
                }))
        }
    }
}

#Preview {
    ContentView27()
}
