//
//  ProfileView.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: viewModel.profile.profileImageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .clipShape(Circle())

                Text(viewModel.profile.name)
                    .font(.title)
                Text(viewModel.profile.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Profile")
        }
    }
}
