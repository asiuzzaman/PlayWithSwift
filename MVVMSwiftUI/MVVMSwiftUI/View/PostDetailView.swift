//
//  PostDetailView.swift
//  MVVMSwiftUI
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import SwiftUI

struct PostDetailView: View {
    let post: Post

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(String(post.id))
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(post.body)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Post Details")
    }
}

#Preview {
    PostDetailView(post: Post(id: 3, title: "Title of the content", body: "The is detail content")).navigationBarTitleDisplayMode(.inline)
}
