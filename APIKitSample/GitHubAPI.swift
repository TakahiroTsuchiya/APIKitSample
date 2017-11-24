//
//  GitHubAPI.swift
//  APIKitSample
//
//  Created by Takahiro Tsuchiya on 2017/11/24.
//  Copyright © 2017 Takahiro Tsuchiya. All rights reserved.
//
import APIKit

final class GitHubAPI {

    private init() {}
    
    struct SearchRepositories: GitHubRequest {

        typealias Response = SearchRepositoriesResponse

        let method: HTTPMethod = .get

        let path: String = "/search/repositories"

        var parameters: Any? {
            return ["q": query, "page": 1]
        }
        
        let query: String
    }
}
