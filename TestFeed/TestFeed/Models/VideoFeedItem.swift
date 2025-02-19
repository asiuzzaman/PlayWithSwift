//
//  VideoFeedItem.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
struct VideoFeedItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let videoURL: URL // Use URL instead of String
}
