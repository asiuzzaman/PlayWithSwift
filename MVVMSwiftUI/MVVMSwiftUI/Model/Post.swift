//
//  Post.swift
//  MVVMSwiftUI
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation
// Model for the API response
struct Post: Identifiable, Codable {
    let id: Int
    let title: String
    let body: String
}
