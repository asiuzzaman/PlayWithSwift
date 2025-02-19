//
//  NotificationItem.swift
//  TestFeed
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
struct NotificationItem: Identifiable {
    let id = UUID()
    let message: String
    let timestamp: Date
}
