//
//  Posts.swift
//  MVVMArchitechture
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation

// Models/Post.swift
struct Post: Codable { // both confirm encode and decodable , json parsing is easy
    let id: Int
    let title: String
    let body: String
}
