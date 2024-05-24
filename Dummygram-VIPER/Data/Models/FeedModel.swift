//
//  FeedModel.swift
//  Dummygram-VIPER
//
//  Created by Bagas Ilham on 24/05/24.
//

import Foundation

struct FeedModel: Codable {
    let id: String?
    let image: String?
    let likes: Int?
    let owner: UserModel?
    let publishDate: String?
    let tags: [String]?
    let text: String?
}
