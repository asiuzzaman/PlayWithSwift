//
//  PostCell.swift
//  MVVMSwiftUI
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import SwiftUICore
// Custom cell for each post
struct PostCell: View {
    let post: Post
    let color: Color // Add a color property

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.title)
                .font(.headline)
                .lineLimit(2)
            Text(post.body)
                .font(.subheadline)
                .lineLimit(3)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(color) // Use the color as the background
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
