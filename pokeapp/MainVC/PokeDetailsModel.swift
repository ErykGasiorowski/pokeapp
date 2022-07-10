//
//  PokeDetailsModel.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation

struct PokeDetails: Codable {
    let id: Int
    let name: String?
    let order: Int?
    let types: [TypeElement]
    let sprites: Sprites
}
    
struct Species: Codable {
        let name: String
        let url: String
}
    
struct TypeElement: Codable {
        let slot: Int
        let type: Species
}

struct Sprites: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
