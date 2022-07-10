//
//  SearchResource.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation
import Moya

enum SearchResource: TargetType {
    
    case getSearchResults
    case getPokemonInfo(String)
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "pokemon"
        case .getPokemonInfo(let pokeName):
            return "pokemon/\(pokeName)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchResults, .getPokemonInfo:
            return .get
        }
    }
    
    var headers: [String: String]? {
        return getHeaders()
    }
    
    var task: Task {
        switch self {
        case .getSearchResults:
            return .requestParameters(parameters: ["?":"limit=100000&offset=0"], encoding: URLEncoding.default)
            
        case .getPokemonInfo(let pokeName):
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
        
    }
}
