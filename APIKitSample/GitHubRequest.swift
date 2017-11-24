//
//  GitHubRequest.swift
//  APIKitSample
//
//  Created by Takahiro Tsuchiya on 2017/11/07.
//  Copyright © 2017 Takahiro Tsuchiya. All rights reserved.
//

import APIKit

protocol GitHubRequest: Request {
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}

extension GitHubRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(Response.self, from: data)
    }
}

struct SearchRepositoriesResponse: Decodable {
    let items: [Repository]
}

struct Repository: Decodable {
    let id: Int
    let fullName: String
    let createdAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case createdAt = "created_at"
    }
}

