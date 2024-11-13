//
//  ContentView35.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 11/14/24.
//

import SwiftUI

	// Reference: https://youtu.be/DEhGTw_Z7Jc?si=6293AmvEnR8hQKQB
 struct ContentView35: View {
   @Environment(\.dismiss) var dismiss
   
   @State private var textWidth: CGFloat = .zero
   @State private var offsetX: CGFloat = .zero

   @Binding var text: String
   @Binding var fontColor: Color
   @Binding var fontSize: CGFloat
   @Binding var background: Color
   @Binding var duration: Double

   var body: some View {
	 ZStack {
	   GeometryReader { geo in
		 Image(.led)
		   .renderingMode(.template)
		   .resizable()
		   .scaledToFill()
		   .frame(width: geo.size.width, height: geo.size.height)
		   .foregroundStyle(background.opacity(0.6))

		 // 屬性順序重要
		 Text(text)
		   .font(.system(size: fontSize))
		   .fontDesign(.monospaced)
		   .fontWeight(.bold)
		   .foregroundStyle(fontColor)
		   .fixedSize()
		   .background {
			 GeometryReader { textGeo -> Color in
			   DispatchQueue.main.async {
				 textWidth = textGeo.size.width
			   }

			   return Color.clear
			 }
		   }
		   .offset(x: offsetX)
		   .rotationEffect(.degrees(90))
		   .position(x: geo.size.width / 2)
		   .mask {
			 Image(.led)
			   .renderingMode(.template)
			   .resizable()
			   .scaledToFill()
			   .frame(width: geo.size.width, height: geo.size.height)
		   }
		   .onAppear {
			 DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
			   offsetX = geo.size.height + textWidth / 2
			 }

			 DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			   withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
				 offsetX = -textWidth / 2
			   }
			 }
		   }
	   }
	 }
	 .overlay(alignment: .bottomTrailing) {
	   Button(action: {
		 dismiss()
	   }, label: {
		 Image(systemName: "xmark.circle.fill")
		   .padding([.bottom, .trailing], 20)
		   .font(.largeTitle)
	   })
	 }
	 .ignoresSafeArea()
	 .background(.black)
   }
 }

 #Preview {
	 ContentView35(
		text: .constant("SwiftUI"),
		fontColor: .constant(.yellow),
		fontSize: .constant(200),
		background: .constant(.green),
		duration: .constant(5)
	 )
 }
