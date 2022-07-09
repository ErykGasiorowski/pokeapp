//
//  MainVCViewModel.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation
import RxSwift
import RxCocoa

class MainVCViewModel: BaseViewModel {
    
    private let service: SearchService
    
    let searchForPokemons = BehaviorRelay<[PokemonsArray]>(value: [])
    
    var name = ""
    
    init(service: SearchService) {
        self.service = service
    }
    
    func navigateToDetails(_ name: String?){
        if let name = name {
            AppNavigator.shared.navigate(to: Routes.details(name), with: .push)
        }
    }
}

extension MainVCViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: String(describing: PokeListViewCell.self), for: indexPath) as? PokeListViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
}
