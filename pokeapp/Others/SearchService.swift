//
//  SearchService.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation
import RxSwift
import Moya

protocol SearchService {
    func getSearchResults() -> Observable<PokemonsArray>
    func getPokemonInfo(pokeName: String) -> Observable<[PokeDetails]>
}

class SearchServiceImpl: BaseApiService<SearchResource>, SearchService {
    
    static var shared = SearchServiceImpl()
    
    func getSearchResults() -> Observable<PokemonsArray> {
        return request(for: .getSearchResults)
            .map {(items: PokemonsArray, _ response: Response) in
                return items
        }
    }
    
    func getPokemonInfo(pokeName: String) -> Observable<[PokeDetails]> {
        return request(for: .getPokemonInfo(pokeName))
            .map {(item: [PokeDetails], _ response: Response) in
                return item
        }
    }
}
