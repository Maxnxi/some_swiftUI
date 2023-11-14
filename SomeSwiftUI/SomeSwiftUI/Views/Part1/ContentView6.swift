//
//  ContentView6.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 14/11/2566 BE.
//

import SwiftUI

struct ContentView6: View {
    
    @State private var showDetail: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showDetail.toggle()
            }, label: {
                VStack{
                    Text("Button")
                    Text("Show Details")
                }
            })
            .padding()
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
    }
}

#Preview {
    ContentView6()
}
