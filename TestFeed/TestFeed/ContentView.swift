//
//  ContentView.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VideoFeedView()
                .tabItem {
                    Label("Videos", systemImage: "video.fill")
                }

            NotificationView()
                .tabItem {
                    Label("Notifications", systemImage: "bell.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
