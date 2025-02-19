//
//  ProfileViewModel.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile

    init() {
        // Simulate a network call
        profile = UserProfile(name: "John Doe", email: "john.doe@example.com", profileImageURL: "https://example.com/profile.jpg")
    }
}
