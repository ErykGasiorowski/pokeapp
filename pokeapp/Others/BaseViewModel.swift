//
//  BaseViewModel.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation
import RxCocoa
import RxSwift

class BaseViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    let state = BehaviorRelay<ViewModelState>(value: .idle)
    
    func observeState() -> Observable<ViewModelState> {
        return state.asObservable()
    }
}
