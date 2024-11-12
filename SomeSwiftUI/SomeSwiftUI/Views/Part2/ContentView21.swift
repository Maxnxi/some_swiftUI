//
//  ContentView21.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//


import SwiftUI

struct ContentView21: View {
    
    @State private var rotation = 0.0
    
    var body: some View {
        VStack {
            Slider(value: $rotation, in: 0...360, step: 1.0)
            Text("Hello, World! 0")
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.green, lineWidth: 5)
                )
//                .font(Font.custom("Roboto", size: 17))
            
            Text("Hello, World! 1")
                .border(.red, width: 5)
            Text("Hello, World! 2")
                .offset(x: 15, y: 15)
                .padding(.bottom, 20)
                .border(.red)
                .blur(radius: 3)
            
            Text("Hello, World! 3")
                .font(.largeTitle)
                .padding(1)
                .background(Color.orange)
                .padding(2)
                .background(Color.green)
                .opacity(0.5)
            
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "apple.logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                ZStack{
                    Circle()
//                        .stroke(Color.red, lineWidth: 15)
                        .stroke(.red, style: StrokeStyle(lineWidth: 15, dash: [10, 20, 1, ])
                        )
                        .shadow(color: .green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 150, height: 150)
                .border(.yellow)
                .offset(x: -50, y: -120)
                
                ZStack{
                    Circle()
                        .strokeBorder(Color.red, lineWidth: 15)
                }
                .frame(width: 150, height: 150)
                .border(.yellow)
                .offset(x: -220, y: -120)
                
                
                Text("This photo was made by Apple")
                    .foregroundStyle(.white)
                    .padding(4)
                    .background(Color.blue)
                    .offset(x: -7, y: -7)
//                    .rotationEffect(.radians(.pi*7/4))
//                    .rotationEffect(.degrees(rotation))
                    .rotationEffect(.degrees(rotation), anchor: .topLeading)
                    .rotation3DEffect(
                        .degrees(rotation),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(x:-330)
                    .aspectRatio(contentMode: .fit)
//                    .colorMultiply(.red)
//                    .tint(.yellow)
                    .foregroundStyle(.green)
                    .colorMultiply(.blue)
                    .saturation(0.8)
                    .contrast(0.5)
            }
        }
    }
}

#Preview {
    ContentView21()
}


/// more info
///  https://ericasadun.com/2020/06/25/coloring-svg-assets-in-swiftui/
