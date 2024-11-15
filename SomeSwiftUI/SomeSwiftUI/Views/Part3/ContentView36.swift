//
//  ContentView36.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 11/15/24.
//

import SwiftUI

// MARK: - AnimationPracticeScreen

// Reference = https://fatbobman.com/en/posts/mastering-transaction/
struct ContentView36: View {
  @State private var isActive: Bool = false
  @State private var isScale: Bool = false

  @State private var isActive2: Bool = false

  @State private var pathStore: PathStore = .init()

  private let whSize: CGFloat = 80

  var body: some View {
	@Bindable var pathStore = pathStore

	VStack(spacing: 40) {
	  NavigationStack(path: $pathStore.path) {
		List {
		  Button("Go Link without Animation") {
			var transaction = Transaction(animation: .none)
			transaction.disablesAnimations = true
			withTransaction(transaction) {
			  pathStore.path.append(1)
			}
		  }
		  Button("Go Link with Animation") {
			pathStore.path.append(1)
		  }
		}
		.navigationDestination(for: Int.self) {
		  ChildView(store: pathStore, n: $0)
		}
	  }
	  .frame(maxHeight: 200)
	  
	  Group {
		Circle()
		  .fill(isActive ? .red : .orange)
		  .animation(.smooth(duration: 0.2), value: isActive)
		  .frame(width: whSize, height: whSize)
		  .scaleEffect(isScale ? 1.2 : 1.0)
		  .animation(.bouncy(duration: 2), value: isScale)

		RoundedRectangle(cornerRadius: 20)
		  .animation(.smooth(duration: 0.2)) {
			$0.foregroundColor(isActive ? .blue : .green)
		  }
		  .frame(width: whSize, height: whSize)
		  .transaction {
			$0.animation = .spring(duration: 0.5, bounce: 0.5)
		  } body: {
			$0.scaleEffect(isScale ? 1.5 : 1)
		  }

		Button {
		  isActive.toggle()
		  isScale.toggle()
		} label: {
		  Label {
			Text("Use .animation")
		  } icon: {
			Image(systemName: "circles.hexagonpath")
		  }
		  .font(.title)
		}
	  }

	  Group {
		RoundedRectangle(cornerRadius: 20)
		  .fill(isActive2 ? .gray : .cyan)
		  .frame(width: whSize, height: isActive2 ? 100 : whSize)
		  .animation(.smooth(duration: 0.2), value: isActive2)

		Button {
		  // Example 1: Use withAnimation
		  /* withAnimation(.spring(duration: 0.5, bounce: 0.8)) {
			 isActive2.toggle()
		   } */

		  // Example 2: Use withTransaction
		  var transaction = Transaction(animation: .none)
		  transaction.disablesAnimations = true
		  withTransaction(transaction) {
			isActive2.toggle()
		  }
		} label: {
		  Label {
			Text("Use withAnimation")
		  } icon: {
			Image(systemName: "circles.hexagonpath")
		  }
		  .font(.title)
		}
	  }
	}
  }
}

// MARK: - PathStore

@Observable
class PathStore {
  var path: [Int] = []
}

// MARK: - ChildView

struct ChildView: View {
  let store: PathStore
  let n: Int
  @Environment(\.dismiss) var dismiss
  var body: some View {
	List {
	  Button("\(n) Dismiss without Animation") {
		var transaction = Transaction(animation: .none)
		transaction.disablesAnimations = true
		withTransaction(transaction) {
		  store.path = []
		}
	  }
	  Button("\(n) Dismiss with Animation") {
		dismiss()
	  }
	}
  }
}

#Preview {
    ContentView36()
}
