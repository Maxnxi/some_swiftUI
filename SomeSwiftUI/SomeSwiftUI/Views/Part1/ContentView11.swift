//
//  ContentView11.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView11: View {
    
    @State private var tapCount: Int = 0
    
    @State private var foregroundStyle :HierarchicalShapeStyle = .primary
    @State private var backGroundColor: Color = .gray
    @State private var transitionCloud: AnyTransition = .identity
    
    var body: some View {
        
        VStack {
            Text("Hello, World!")
            Divider()
                .padding()
            
            HStack {
                Image(systemName: "cloud.fill")
                    .padding()
                    .transition(transitionCloud)
                Text("Tap me")
                    .foregroundStyle(foregroundStyle)
                    .font(.title)
    //                .onTapGesture {
    //                    tapCount += 1
    //                }
                    .frame(width: 200, height: 200)
                    //.padding()
                    .background(backGroundColor)
                    
                    .clipShape(
                        Circle()
                    )
                    .background(Color.pink)
                
                    .contentShape(Circle())
//                    .background(Color.yellow)
                    .onTapGesture {
                        tapCount += 1
                        foregroundStyle = .secondary
                        backGroundColor = .accentColor
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            foregroundStyle = .primary
                            backGroundColor = .gray
                        }
                    }
                    .task {
                        
                }
                Image(systemName: "cloud.fill")
                    .padding()
            }
            .background(.blue)
            .contentShape(Rectangle())
            .onTapGesture(count: 2) {
                tapCount += 10
            }
            .gesture(
                LongPressGesture(minimumDuration: 2)
                    .onEnded({ _ in
                        foregroundStyle = .quaternary
                        backGroundColor = .clear
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            foregroundStyle = .primary
                            backGroundColor = .gray
                        }
                    })
            )
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onChanged({ value in
                        transitionCloud = .offset(x: value.location.x, y: value.location.y)
                    })
                    .onEnded({ value in
                        transitionCloud = .identity
                    })
            
            )
                
            
            Text("Tapped \(tapCount) times")
                .frame(
                    width: 200,
                    alignment: .leading
                )
                .background(.green)
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Tapped")
                    Text("\(tapCount)")
                        .font(.title)
                    Text("times")
                    Spacer()
                }
                .background(.red)
                .padding()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .background(.purple)
                .padding()
            }
            .background(.yellow)
            .padding()
            
            Divider()
        }
    }
}

#Preview {
    ContentView11()
}
