//
//  ListResponseModel.swift
//  Dummygram-VIPER
//
//  Created by Bagas Ilham on 24/05/24.
//

import Foundation

struct ListResponseModel<T>: Codable where T: Codable {
    let data: T?
    let limit: Int?
    let page: Int?
    let total: Int?
}
