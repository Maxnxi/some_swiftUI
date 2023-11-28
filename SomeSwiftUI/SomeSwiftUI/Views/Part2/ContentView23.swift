//
//  ContentView23.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 27.11.2023.
//

import SwiftUI

struct CurveShape: View {
    private var heightConst = 60.0
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: heightConst))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: heightConst), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
            path.addLine(to: CGPoint(x: 0, y: heightConst))
        }
        .fill(Color.white)
        .rotationEffect(.init(degrees: 180))
    }
}

struct ContentView23: View {
    
    @State private var selected = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack {
                
                HStack {
                    Button(action: {
                        self.selected = 0
                    }, label: {
                        VStack {
                            Image(systemName: "homekit")
                            Text("Home")
                                .font(.footnote)
                        }
                        .foregroundStyle(self.selected == 0 ? .blue : .black)
                    })
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 1
                    }, label: {
                        VStack {
                            Image(systemName: "magnifyingglass.circle.fill")
                            Text("Search")
                                .font(.footnote)
                        }
                        .foregroundStyle(self.selected == 1 ? .blue : .black)
                    })
                           
                    Spacer().frame(width: 120)

                    Button(action: {
                        self.selected = 2
                    }, label: {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Person")
                                .font(.footnote)
                        }
                        .foregroundStyle(self.selected == 2 ? .blue : .black)
                    })
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selected = 3
                    }, label: {
                        VStack {
                            Image(systemName: "cloud.fill")
                            Text("Cloud")
                                .font(.footnote)
                        }
                        .foregroundStyle(self.selected == 3 ? .blue : .black)
                    })
                    
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurveShape())
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                        .renderingMode(.original)
                        .padding(18)
                        
                })
                .background(Color.yellow)
                .clipShape(Circle())
                .offset(y: -32)
                .shadow(radius: 5)
            }
        }
        .background(Color.init(uiColor: UIColor.lightGray))
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    ContentView23()
}
