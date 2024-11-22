//
//  ContentView38.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 11/22/24.
//

import SwiftUI


// MARK: - ContentView

struct ContentView38: View {
  let items: [GridItem] = [
	GridItem(.flexible(), spacing: 1),
	GridItem(.flexible(), spacing: 1),
	GridItem(.flexible(), spacing: 1),
  ]

  let images: [ImageItem] = [
	ImageItem(color: .red, size: .large),
	ImageItem(color: .orange, size: .small),
	ImageItem(color: .yellow, size: .medium),
	ImageItem(color: .green, size: .small),
	ImageItem(color: .blue, size: .small),
	ImageItem(color: .cyan, size: .large),
	ImageItem(color: .purple, size: .small),
	ImageItem(color: .pink, size: .small),
	ImageItem(color: .red, size: .small),
  ]

  var body: some View {
	ScrollView {
	  LazyVGrid(columns: items, spacing: 1) {
		ForEach(images) { item in
		  if item.size == .large {
			ImageView(color: item.color)
			  .frame(height: 200)
			  .gridCellColumns(2)
		  } else if item.size == .medium {
			ImageView(color: item.color)
			  .frame(height: 100)
		  } else {
			ImageView(color: item.color)
			  .frame(height: 100)
		  }
		}
	  }
	}
  }
}

// MARK: - ImageView

struct ImageView: View {
  let color: Color

  var body: some View {
	Rectangle()
	  .fill(color)
	  .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

// MARK: - ImageItem

struct ImageItem: Identifiable {
  let id = UUID()
  let color: Color
  let size: ImageSize
}

// MARK: - ImageSize

enum ImageSize {
  case small, medium, large
}


#Preview {
    ContentView38()
}
