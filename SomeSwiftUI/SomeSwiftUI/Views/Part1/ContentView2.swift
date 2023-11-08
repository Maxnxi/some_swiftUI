//
//  ContentView1.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 7/11/2566 BE.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        
        Text("""
Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello
        Hello Hello Hello Hello
        Hello Hello Hello Hello
        Hello Hello Hello Hello
""")
        //.kerning(5)
        .tracking(5)
        .lineLimit(3)
        .truncationMode(.middle)
        .font(.body)
        .multilineTextAlignment(.center)
        //.background(Color.init())
        .foregroundColor(.blue)
        .lineSpacing(50)
        .padding()
        .background(.yellow)
        .padding()
        .background(.red)
        
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
