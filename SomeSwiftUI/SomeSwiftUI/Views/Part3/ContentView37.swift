//
//  ContentView37.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 11/16/24.
//

import SwiftUI

// Reference = https://youtu.be/TU6tYZei0EQ?si=AaosqX6D0eLxQ5m0
struct ContentView37: View {
	
	@State private var currentIcon: AppIcon = .appicon
	
	var body: some View {
		List {
			Section("Chooess App Icon") {
				ForEach(AppIcon.allCases, id: \.rawValue) { icon in
					HStack {
						Image(icon.previewImage)
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 60, height: 60)
							.clipShape(RoundedRectangle(cornerRadius: 16))
						
						Text(icon.rawValue)
							.fontWeight(.semibold)
							.fontDesign(.rounded)
						
						Spacer(minLength: 0)
						
						Image(systemName: currentIcon == icon ? "checkmark.circle.fill" : "circle")
							.font(.title3)
							.foregroundStyle(currentIcon == icon ? .green : Color.primary)
					}
					.contentShape(.rect)
					.onTapGesture {
						currentIcon = icon
						UIApplication.shared.setAlternateIconName(icon.icon)
					}
				}
			}
		}
		.navigationTitle("App Icons")
		.navigationBarTitleDisplayMode(.inline)
		.onAppear {
			if let alternativeIcon = UIApplication.shared.alternateIconName,
			   let appIcon = AppIcon.allCases.first(where: { $0.rawValue == alternativeIcon }) {
				currentIcon = appIcon
			} else {
				currentIcon = .appicon
			}
		}
	}
}

private enum AppIcon: String, CaseIterable {
	
	case appicon = "AppIcon1"
	
	case appicon2 = "AppIcon2"
	
	case appicon3 = "AppIcon3"
	
	var icon: String? {
		self == .appicon ? nil : rawValue
	}
	
	var previewImage: String {
		switch self {
		case .appicon:
			"logo"
		case .appicon2:
			"logo2"
		case .appicon3:
			"logo3"
		}
	}
}

#Preview {
	NavigationStack {
		ContentView37()
	}
}
