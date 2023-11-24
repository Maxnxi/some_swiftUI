//
//  ContentView13.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 24.11.2023.
//

import SwiftUI

struct ContentView13: View {
    
    @State private var users = ["Ian", "Ivan", "Iordan" ]
    
    var body: some View {
        
        // MARK: - 1
        //        NavigationView() {
        //            NavigationLink(destination: Text("Destination")) { Text("Navigate")
        //            }
        //            .navigationBarTitle(
        //                "Welcome",
        //                displayMode: .large
        //                // .inline // .large // .automatic
        //            )
        //        }
        
        // MARK: - 2
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
            // 1
                .toolbar {
                    Button("About 1") {
                        print("About tapped!")
                    }
                    
                    Button("Help 1") {
                        print("Help tapped!")
                    }
                }
            
            // 2
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Help 2") {
                            print("Help tapped!")
                        }
                    }
                }
            
            // 3
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("About 3") {
                            print("About tapped!")
                        }
                        
                        Button("Help 3") {
                            print("Help tapped!")
                        }
                    }
                    
                    // 4
                    ToolbarItemGroup(placement: .secondaryAction) {
                        Button("Settings 4") {
                            print("Credits tapped")
                        }
                        
                        Button("Email Me 4") {
                            print("Email tapped")
                        }
                        
                        Button("Edit 5") {
                            print("Edit 5 tapped")
                            
                        }
                        
                        EditButton()
                    }
                }
            // 5
            
            List {
                ForEach(users, id: \.self) {
                    user in
                    Text(user)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            
        }
        
        
        // NavigationSplitView
        // https://www.appoda.com/navigationsplitview-swiftui/
    }
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    func move(
        from source: IndexSet,
        to destination: Int
    ) {
        users.move(
            fromOffsets: source,
            toOffset: destination
        )
    }
}

#Preview {
    ContentView13()
}
