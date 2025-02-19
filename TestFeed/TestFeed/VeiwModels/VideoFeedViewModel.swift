//
//  VideoFeedViewModel.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import Foundation
import Combine

class VideoFeedViewModel: ObservableObject {
    @Published var videos: [VideoFeedItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    init() {
        fetchVideos()
    }

    private func fetchVideos() {
        isLoading = true
        errorMessage = nil

        // Simulate a network call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.videos = [
                VideoFeedItem(title: "Video 1", description: "This is video 1", videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
                VideoFeedItem(title: "Video 2", description: "This is video 2", videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
                VideoFeedItem(title: "Video 3", description: "This is video 3", videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")
            ]
            self.isLoading = false
        }
    }
}
