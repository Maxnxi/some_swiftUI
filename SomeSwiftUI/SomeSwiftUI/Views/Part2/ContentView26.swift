//
//  ContentView26.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 27.11.2023.
//

import SwiftUI

struct Post: Codable, Identifiable {
    var id = UUID()
    var title: String
    var body: String
}

class API {
    func getPost(completion: @escaping ([Post]) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let posts = try? JSONDecoder()
                .decode([Post].self, from: data!) else {
                return completion([])
            }
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
        
        func getPost2() async throws -> [Post] {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let decodedData = try JSONDecoder().decode([Post].self, from: data)
            
            return decodedData
        }
        
        
    }
}

struct ContentView26: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView26()
}
