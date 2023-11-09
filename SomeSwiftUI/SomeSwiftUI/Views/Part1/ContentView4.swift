//
//  ContentView4.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 7/11/2566 BE.
//

import SwiftUI

struct ContentView4: View {
    var body: some View {
        let colors = Gradient(colors: [
            .red, .yellow, .green, .blue, .purple])
        let gradient = RadialGradient(
            gradient: colors,
            center: .center,
            startRadius: 10,
            endRadius: 100
        )
        let angularGradient = AngularGradient.init(
            gradient: colors,
            center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
        )
        
        return
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(
                    LinearGradient(
                        gradient: colors,
                        startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                        endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/
                    ))
                //.strikethrough()
            Circle()
                //.fill(gradient)
                .frame(
                    width: 200,
                    height: 200
                )
                .border(angularGradient, width: 50)
            
            Capsule()
                //.fill(angularGradient)
                .frame(
                    width: 200,
                    height: 200
                )
                .border(angularGradient, width: 50)
                
                
            
        }
        
    }
}

#Preview {
    ContentView4()
}
