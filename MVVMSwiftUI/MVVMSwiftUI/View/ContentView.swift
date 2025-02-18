//
//  ContentView.swift
//  MVVMSwiftUI
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostsViewModel()

    // Define the grid layout
    let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 10)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.posts) { post in
                            PostCell(post: post)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts() // Fetch data when the view appears
            }
        }
    }
}

#Preview {
    ContentView()
}
