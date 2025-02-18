//
//  PostsViewModel.swift
//  MVVMArchitechture
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
// ViewModels/PostsViewModel.swift
import Foundation

class PostsViewModel {
    var posts: [Post] = []
    var reloadCollectionView: (() -> Void)?

    func fetchPosts() {
        APIService.shared.fetchPosts { [weak self] posts in
            guard let self = self, let posts = posts else { return }
            self.posts = posts
            self.reloadCollectionView?()
        }
    }
}
