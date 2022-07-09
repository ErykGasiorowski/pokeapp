//
//  Routes.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import Foundation
import UIKit

enum Routes: Route {
    case list
    case details(String)

    var screen: UIViewController {
        switch self {
        case .list:
            return buildMainViewController()
        case .details(let name):
            return buildDetailsViewController(name)
        }
    }
    
    private func buildMainViewController() -> UIViewController {
        let controller = MainViewController()
        controller.viewModel = MainVCViewModel(service: SearchServiceImpl.shared)
        return controller
    }
    
    private func buildDetailsViewController(_ repo: String) -> UIViewController {
        //let viewModel =
        let controller = UIViewController()
        return controller
    }
}
