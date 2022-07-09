//
//  PokeModel.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation

struct PokemonsArray: Codable {
    let count: Int
    let next: String
    //let previous: JSONNull?
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let url: String
}
