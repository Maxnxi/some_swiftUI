//
//  ContentView22.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView22: View {
    
    @State private var scale: CGFloat = 1
    @State private var angle: CGFloat = 0
    @State private var borderThickness: CGFloat = 1
    
    @State private var showingWelcome = false
    
    @State private var opacity = 1.0

    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button {
//                self.scale += 1
                self.angle += 45
                self.borderThickness += 1
            } label: {
                Text("Tap me")
                
                //1
//                    .scaleEffect(scale)
//                    .animation(
//                        .linear(duration: 5)
////                        .easeIn
////                            .easeInOut
//                    )
                
                //2
//                    .padding()
//                    .border(Color.red, width: borderThickness)
//                    .rotationEffect(.degrees(angle))
//                    .animation(.easeIn, value: 5)
                
                //3
//                    .padding()
//                    .rotationEffect(.degrees(angle))
//                    .animation(
//                        .interpolatingSpring(
//                            mass: 1,
//                            stiffness: 1,
//                            damping: 0.5,
//                            initialVelocity: 5
//                        )
//                    )
                
                //4
                
               
                
            }
            
            Divider()
            
            Toggle(isOn: $showingWelcome) {
                Text("Toggle level")
            }
            .padding()
            
            if showingWelcome {
                Text("Heloe SwiftUI!")
            }
            
            Divider()
            
            // 5
            
            Button(action: {
                withAnimation(.linear(duration: 3)) {
                    self.opacity -= 0.4
                }
            }, label: {
                Text("Button")
                    .padding()
                    .opacity(opacity)
            })
            
            Divider()
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(angle))
//                .animation(
//                    Animation.easeInOut(duration: 3)
//                        .delay(1)
//                )
//                .onTapGesture {
//                    self.angle += 360
//                }
            
            // 6
                .scaleEffect(scale)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    return withAnimation(repeated) {
                        self.scale = 0.5
                    }
                    
                }
            
        }
    }
}

#Preview {
    ContentView22()
}
