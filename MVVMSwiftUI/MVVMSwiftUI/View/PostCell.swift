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
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
