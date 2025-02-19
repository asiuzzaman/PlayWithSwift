import Combine
import Foundation
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
                VideoFeedItem(
                    title: "Video 1",
                    description: "This is video 1",
                    videoURL: URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")!
                ),
                VideoFeedItem(
                    title: "Video 2",
                    description: "This is video 2",
                    videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4")!
                ),
                VideoFeedItem(
                    title: "Video 3",
                    description: "This is video 3",
                    videoURL: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!
                )
            ]
            self.isLoading = false
        }
    }
}
