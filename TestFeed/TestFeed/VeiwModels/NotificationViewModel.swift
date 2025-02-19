//
//  NotificationViewModel.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import Foundation

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationItem] = []

    init() {
        fetchNotifications()
    }

    private func fetchNotifications() {
        // Simulate a network call
        notifications = [
            NotificationItem(message: "You have a new like", timestamp: Date()),
            NotificationItem(message: "Your video was shared", timestamp: Date().addingTimeInterval(-3600)),
            NotificationItem(message: "New follower", timestamp: Date().addingTimeInterval(-7200))
        ]
    }
}
