//
//  APIEndPoints.swift
//  Generic API Layer
//
//  Created by AKASH on 02/08/23.
//

import Foundation

struct PostModel: Codable {
    let title: String?
    let body: String?
    let userId: Int?
    let id: Int?
}

struct postQueryModel: Codable {
    let userId: Int?
}

enum FakeAPI {
    case createPost(postModeL: PostModel)
    case getPost(model: postQueryModel)
    case upload(model: PostMediaModel)
}

extension FakeAPI: APIProtocol {
    var method: APIMethod {
        switch self {
        case .createPost, .upload:
            return .post
        case .getPost:
            return .get
        }
    }
    
    var baseURL: String {
//        return "https://jsonplaceholder.typicode.com"
        return "https://freeimage.host/api/1"
    }
    
    var path: String {
        switch self {
        case .createPost, .getPost:
            return "/posts"
        case .upload:
            return "/upload"
        }
    }
    
    var task: Request {
        switch self {
        case .createPost(let postModeL):
            return .jsonEncoding(postModeL.asDictionary)
        case .getPost(let model):
            return .queryString(model.asDictionary)
        case .upload(let model):
            var formData = MultipartRequest()
            formData.add(key: "format", value: model.format ?? "")
            formData.add(key: "key", value: model.key ?? "")
            formData.add(key: "source", fileName: "\(UUID().uuidString).jpeg", fileMimeType: "image/jpeg", fileData: model.source ?? Data())
            return .multiPart(formData)
        }
    }
    
    var header: [String : String] {
        switch self {
        case .createPost, .getPost:
            return ["Content-type": "application/json"]
        case .upload:
            return ["Content-type": "multipart/form-data"]
        }
    }
}

struct PostMediaModel: Codable {
    var source: Data?
    var key: String? = "6d207e02198a847aa98d0a2a901485a5"
    var format: String? = "json"
}
