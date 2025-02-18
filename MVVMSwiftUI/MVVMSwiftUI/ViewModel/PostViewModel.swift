//
//  PostViewModel.swift
//  MVVMSwiftUI
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation


import Foundation
import Combine

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = [] // Holds the fetched posts
    @Published var isLoading = false // Tracks loading state
    @Published var errorMessage: String? // Holds error messages

    private var cancellables = Set<AnyCancellable>()

    // Fetch data from the API
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            errorMessage = "Invalid URL"
            return
        }

        isLoading = true
        errorMessage = nil

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Extract the data
            .decode(type: [Post].self, decoder: JSONDecoder()) // Decode JSON to [Post]
            .receive(on: DispatchQueue.main) // Update UI on the main thread
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
}
