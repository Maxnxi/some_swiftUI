//
//  ContentView33.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 11/12/24.
//


import VerticalSplit
import SwiftUI

struct ContentView33: View {
	var body: some View {
		VerticalSplit(
			topTitle: "Hello",
			bottomTitle: "Bye"
		) {
			VStack {
				Text(LocalizedStringKey("Welcome"))
					.font(.title)
				
				Divider()
			}
		} bottomView: {
			VStack {
				Text(LocalizedStringKey("Welcome"))
					.font(.title)
				
				Divider()
			}
		}
	}
}

#Preview {
	ContentView33()
		.environment(
			\.locale,
			 .init(identifier: "de")
		)
}


