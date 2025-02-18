//
//  APIService.swift
//  MVVMArchitechture
//
//  Created by Md. Asiuzzaman on 19/2/25.
//

import Foundation

// Services/APIService.swift  Only for network call
import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    func fetchPosts(completion: @escaping ([Post]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(nil)
            return
        }

        /// URL session for downloading data
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            // part of json parsing.
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
