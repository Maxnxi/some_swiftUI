//
//  SomeSwiftUIApp.swift
//  SomeSwiftUI
//
//  Created by Ponomarev Maksim on 7/11/2566 BE.
//

import SwiftUI

@main
struct SomeSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            /// Base
            /*
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            */
            ContentView31()
                .environment(\.locale, .init(identifier: "de"))
        }
    }
}
