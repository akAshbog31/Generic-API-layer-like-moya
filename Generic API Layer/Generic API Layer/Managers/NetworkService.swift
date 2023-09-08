//
//  NetworkService.swift
//  Generic API Layer
//
//  Created by AKASH on 02/08/23.
//

import Foundation

struct CommentModel: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

protocol NetworkService {
    func createPost(model: PostModel) async throws -> PostModel
    
    func getPostComment(model: postQueryModel) async throws -> [CommentModel]
    
    func uploadMedia(model: PostMediaModel) async throws -> ResponseModel
}

final class NetworkManager: NetworkService {
    func createPost(model: PostModel) async throws -> PostModel {
        return try await APIService.request(FakeAPI.createPost(postModeL: model))
    }
    
    func getPostComment(model: postQueryModel) async throws -> [CommentModel] {
        return try await APIService.request(FakeAPI.getPost(model: model))
    }
    
    func uploadMedia(model: PostMediaModel) async throws -> ResponseModel {
        return try await APIService.request(FakeAPI.upload(model: model))
    }
}
