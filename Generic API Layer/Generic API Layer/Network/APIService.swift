//
//  APIService.swift
//  Generic API Layer
//
//  Created by AKASH on 02/08/23.
//

import Foundation

struct APIService {
    static func request<T: Codable>(_ rout: APIProtocol) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: rout.asURLRequest())
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.badRequest
        }
        switch httpResponse.statusCode {
        case 200...299:
            let json = try JSONDecoder().decode(T.self, from: data)
            return json
        default:
            throw APIError.badRequest
        }
    }
}
