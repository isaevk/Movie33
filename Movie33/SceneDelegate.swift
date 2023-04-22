//
//  SceneDelegate.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
//    
////    let viewController = MainViewController()
////    let navController = UINavigationController(rootViewController: viewController)
////    
//    window = UIWindow(windowScene: windowScene)
////    window?.windowScene = windowScene
//    window?.makeKeyAndVisible()
//    window?.rootViewController = UINavigationController(rootViewController: MainViewController())
    
    let mainRouter = MainRouter.start()
    let initialViewController = mainRouter.entry
    
    // АНРАП!!!!
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = UINavigationController(rootViewController: initialViewController!)
    window?.makeKeyAndVisible()
  }
}

