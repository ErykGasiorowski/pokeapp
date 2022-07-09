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
    func getSearchResults(name: String) -> Observable<PokemonsArray>

}

class SearchServiceImpl: BaseApiService<SearchResource>, SearchService {
    
    static var shared = SearchServiceImpl()
    
    func getSearchResults(name: String) -> Observable<PokemonsArray> {
        return request(for: .getSearchResults(name))
            .map {(items: PokemonsArray, _ response: Response) in
                return items
        }
    }
}
