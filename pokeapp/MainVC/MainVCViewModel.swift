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
    
    let searchForPokemons = BehaviorRelay<[Result]>(value: [])
    let onSuccess = BehaviorRelay<[PokeDetails]>(value: [])
    let onError = PublishSubject<String>()
    var reloadData = PublishSubject<()>()
    
    var query = ""
    var pokeNames = [Result]()
    var pokeResults = [PokeDetails]()
    
    init(service: SearchService) {
        self.service = service
    }
    
    func fetchData() {
        service.getSearchResults()
            .subscribe(onNext: { result in
                self.searchForPokemons.accept(result.results ?? [])
                self.pokeNames.append(contentsOf: result.results)
                self.reloadData.onNext(())
                 print(self.pokeNames)
            }, onError: { error in
                print(error)
            }).disposed(by: disposeBag)
    }
    
    func fetchDetails() {
        
    }
    
    func getDataForTableViewCell() {
        service.getPokemonInfo(pokeName: pokeNames.first?.name ?? "").subscribe(onNext: { result in
            self.onSuccess.accept(result)
            self.pokeResults.append(contentsOf: result)
            print(self.pokeResults)
            self.reloadData.onNext(())
        }, onError: { [weak self] error in
            self?.onError.onNext(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func navigateToDetails(_ name: String?){
        if let name = name {
            AppNavigator.shared.navigate(to: Routes.details(name), with: .push)
        }
    }
}

extension MainVCViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchForPokemons.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: String(describing: PokeListViewCell.self), for: indexPath) as? PokeListViewCell
        else {
            return UITableViewCell()
        }
        
        if pokeResults.count <= indexPath.row {
            return cell
        }
        
        //let item = pokeResults[indexPath.row]
        
//        cell.button.rx.tap.asObservable().bind { [weak self] _ in
//            self?.navigateToDetails(name)
//        }.disposed(by: cell.disposeBag)

        //cell.configure(model: item)
        
        return cell
    }
}
