//
//  ContentView24.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 27.11.2023.
//

import SwiftUI

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape2: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State private var email = ""
    @State private var pass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundStyle(self.index == 0 ? Color.white : Color.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                }
                .padding(.top, 30)
                
                // LOGIN
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelop.fill")
                            .foregroundStyle(.background)
                        TextField("Email Addres", text: $email)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Divider()
                    .background(Color.white.opacity(0.5))
                
                // PASSWORD
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundStyle(.background)
                        SecureField("Email Addres", text: $pass)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Divider()
                    .background(Color.white.opacity(0.5))
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {
                      // todo
                    }, label: {
                        Text("Forget Password?")
                            .foregroundStyle(Color.white.opacity(0.5))
                    })

                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.yellow)
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3) , radius: 10)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35, antialiased: true)
            .padding(25)
            
            Button {
                //
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.green)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)

        }
    }
}

struct Pass: View {
    @State private var email = ""
    @State private var pass = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                
                HStack {
                    VStack(spacing: 10) {
                        Text("SignUp")
                            .foregroundStyle(self.index == 0 ? Color.white : Color.gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                }
                .padding(.top, 30)
                
                // LOGIN
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelop.fill")
                            .foregroundStyle(.background)
                        TextField("Email Addres", text: $email)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Divider()
                    .background(Color.white.opacity(0.5))
                
                // PASSWORD
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundStyle(.background)
                        SecureField("Email Addres", text: $pass)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Divider()
                    .background(Color.white.opacity(0.5))
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button(action: {
                      // todo
                    }, label: {
                        Text("Forget Password?")
                            .foregroundStyle(Color.white.opacity(0.5))
                    })

                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.green)
            .clipShape(CShape2())
            .contentShape(CShape2())
            .shadow(color: Color.black.opacity(0.3) , radius: 10)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35, antialiased: true)
            .padding(25)
            
            Button {
                //
            } label: {
                Text("SignUp")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.green)
                    .clipShape(Capsule())
                    .shadow(radius: 10)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)

        }
    }
}


struct ContentView24: View {
    
    @State private var index = 1
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                Spacer()
                
                Image(systemName: "apple.logo")
                    .resizable()
                    .frame(width: 70, height: 70)
            
                ZStack {
                    Login(index: $index)
                        .zIndex(Double(index))
                    Pass(index: $index)
                }
                    
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                    
                    Text("OR")
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                HStack(spacing: 25) {
                    Button(action: {
                        // todo
                    }, label: {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    })
                    
                    Button(action: {
                        // todo
                    }, label: {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    })
                    
                    Button(action: {
                        // todo
                    }, label: {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    })
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .background(Color.black)
        .ignoresSafeArea(.all)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView24()
}
