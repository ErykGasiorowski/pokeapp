//
//  PokeDetailsModel.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation

struct Welcome: Codable {
    let id: Int
    let name: String?
    let order: Int?
    let types: [TypeElement]
}
    
struct Species: Codable {
        let name: String
        let url: String
}
    
struct TypeElement: Codable {
        let slot: Int
        let type: Species
}
