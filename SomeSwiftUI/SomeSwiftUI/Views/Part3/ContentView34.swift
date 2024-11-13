//
//  ContentView34.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 11/13/24.
//

import SwiftUI

struct ContentView34: View {
  
  @State private var index: Int = 0
	
	private let colors: [Color] = [
		.red, .orange, .yellow,
		.green, .blue, .cyan,
		.purple
	]
	
	private let titles: [String] = [
		"Java", "Javascript", "Swift",
		"Kotlin", "C#", "Rust",
		"Python", "C++", "Go"
	]
	
  var body: some View {
	Text(titles[index])
	  .font(.largeTitle)
	  .fontWeight(.light)
	  .fontDesign(.rounded)
	  .contentTransition(.numericText())
	  .foregroundStyle(colors[index])
	  .frame(width: 250)
	  .shadow(color: colors[index], radius: 5)
	  .shadow(color: colors[index], radius: 5)
	  .shadow(color: colors[index], radius: 50)
	  .shadow(color: colors[index], radius: 100)
	  .shadow(color: colors[index], radius: 200)
	  .navigationTitle("Glow Text")
	  .navigationBarTitleDisplayMode(.inline)
	  .toolbarRole(.editor)
	  .toolbar(.hidden, for: .tabBar)
	  .task {
		Timer.scheduledTimer(
			withTimeInterval: 1.0,
			repeats: true
		) { timer in
		  withAnimation {
			index = (index + 1) % colors.count
		  }
		}
	  }
  }
}

#Preview {
  NavigationStack {
	  ContentView34()
  }
}
