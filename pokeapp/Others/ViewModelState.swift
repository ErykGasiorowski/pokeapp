//
//  ViewModelState.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation

enum ViewModelState: Equatable {
  case loading
  case error(String)
  case idle
}
