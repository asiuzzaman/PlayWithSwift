//
//  NotificationView.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel = NotificationViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.notifications) { notification in
                NotificationRow(notification: notification)
            }
            .navigationTitle("Notifications")
        }
    }
}

struct NotificationRow: View {
    let notification: NotificationItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(notification.message)
                .font(.headline)
            Text(notification.timestamp, style: .time)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
