//
//  AppDelegate.swift
//  pokeapp
//
//  Created by Eryk Gasiorowski on 09/07/2022.
//

import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let disposeBag = DisposeBag()
    
    static let shared: AppDelegate = {
      guard let appD = UIApplication.shared.delegate as? AppDelegate else {
        return AppDelegate()
      }
      return appD
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootVC = AppNavigator.shared.rootViewController
        window?.rootViewController = rootVC
        
        return true
    }
}

