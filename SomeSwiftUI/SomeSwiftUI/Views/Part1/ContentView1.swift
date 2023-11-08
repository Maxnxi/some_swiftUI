//
//  ContentView1.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 7/11/2566 BE.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        let stack = VStack(spacing: 50) {
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }
            .padding(.bottom, 20)
        
        HStack {
            stack
                .padding(20)
                .background(Color.yellow)
            Divider()
            stack
                .padding(.vertical, 50)
                .background(Color.green)
            Divider()
            stack
                .padding(20)
                .background(Color.black)
                .foregroundColor(.white)
                .padding()
            
            ZStack(alignment: .center) {
                Spacer()
                    .frame(width: 50, height: 200)
                    .background(Color.red)
                VStack {
                    Image(systemName: "cloud.fill")
                        .foregroundColor(.white)
                Divider()
                    Text("cloudy")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            }
            .background(Color.accentColor)
                
            
            
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
