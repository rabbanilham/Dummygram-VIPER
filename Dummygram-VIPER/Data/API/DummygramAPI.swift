//
//  DummygramAPI.swift
//  Dummygram-VIPER
//
//  Created by Bagas Ilham on 24/05/24.
//

import Alamofire
import Foundation

struct DummygramAPI {
    static let shared = DummygramAPI()
    private init () {}
    
    private let baseApiUrl = "https://dummyapi.io/data/v1/"
    private let appId = "6650969e93991aed81fe2b36"
    
    func getPhotos(
        limit: Int = 20,
        page: Int = 0
    ) async throws -> ListResponseModel<[FeedModel]> {
        let queryItems = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        var urlComponents = URLComponents(string: baseApiUrl + "post")
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else { throw URLError(.badURL) }
        
        let headers: HTTPHeaders = ["app-id": appId]
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                headers: headers
            )
            .validate()
            .responseDecodable(of: ListResponseModel<[FeedModel]>.self) { response in
                switch response.result {
                case let .success(data):
                    continuation.resume(returning: data)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
