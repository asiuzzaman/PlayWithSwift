//
//  VideoFeedView.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import SwiftUI

struct VideoFeedView: View {
    @StateObject private var viewModel = VideoFeedViewModel()

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
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.videos) { video in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(video.title)
                                    .font(.headline)
                                Text(video.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                VideoPlayerView(videoURL: video.videoURL)
                                    .frame(height: 200)
                                    .cornerRadius(10)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Video Feed")
        }
    }
}
