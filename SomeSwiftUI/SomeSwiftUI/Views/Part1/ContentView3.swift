//
//  ContentView3.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 7/11/2566 BE.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        Image(systemName: "cloud.sun.fill")
            .resizable()
            .frame(width: 200, height: 200)
            .font(.largeTitle)
            .padding()
            .background(Color.green)
            .foregroundColor(.blue)
//            .cornerRadius(15)
//            .clipShape(Circle())
//            .clipShape(RoundedRectangle(cornerSize: 4))
            .clipShape(Circle())
            .background(
                Circle()
                    .fill(Color.red)
                    .frame(width: 300, height: 400)
            )
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
