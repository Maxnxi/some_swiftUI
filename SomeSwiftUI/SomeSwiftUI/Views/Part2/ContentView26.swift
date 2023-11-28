//
//  ContentView26.swift
//  SomeSwiftUI
//
//  Created by Maksim Ponomarev on 27.11.2023.
//

import SwiftUI
import Combine


enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}

struct Post: Decodable {
    var userId: Int
    var id = Int()
    var title: String
    var body: String
}

class API {
    static let shared = API()
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    private let customQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)

    
    func getPost(completion: @escaping ([Post]) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let posts = try? JSONDecoder()
                .decode([Post].self, from: data!) else {
                return completion([])
            }
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
        
    func getPostAwait() async throws -> [Post] {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode([Post].self, from: data)
        
        return decodedData
    }
    
    func getPostCombine() -> AnyPublisher<[Post], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: customQueue)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw HTTPError.invalidResponse
                }
                let statusCode = httpResponse.statusCode
                
                guard (200..<300).contains(statusCode) else {
                    throw HTTPError.invalidStatusCode
                }
                print("data info ", data)
                return data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .print()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}

struct ContentView26: View {
    
    @State private var postsCompletion: [Post] = []
    @State private var postsAsync: [Post] = []
    @State private var postsCombine: [Post] = []

    @State var cancellable: AnyCancellable?

    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Divider()
            Text("Posts downloaded with completion = \(postsAsync.count)")
            Divider()
            Text("Posts downloaded with async/await = \(postsAsync.count)")
            Divider()
            Text("Posts downloaded with combine = \(postsCombine.count)")
        }
        .task {
            // Completion
            API.shared.getPost(completion: { posts in
                self.postsCompletion = posts
            })
            
            // async/await
            do {
                postsAsync = try await API.shared.getPostAwait()
            } catch {
                debugPrint("Error", #function, error.localizedDescription)
            }
            
            // Combine
            cancellable = API.shared.getPostCombine()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        break
                    }
                }, receiveValue: { posts in
                    self.postsCombine = posts
                })
            
        }
    }
}

#Preview {
    ContentView26()
}
