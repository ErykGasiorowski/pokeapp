//
//  SearchResource.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation
import Moya

enum SearchResource: TargetType {
    
    case getSearchResults(String)
    var path: String {
        switch self {
        case .getSearchResults(let query):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchResults:
            return .get
        }
    }
    
    var headers: [String: String]? {
        return getHeaders()
    }
    
    var task: Task {
        switch self {
        case .getSearchResults(let query):
            return .requestParameters(parameters: ["pokemon":"?limit=100000&offset=0"], encoding: URLEncoding.default)
        }
    }
}
