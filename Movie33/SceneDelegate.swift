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
    let mainRouter = MainRouter.start()
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    guard let rootViewController = mainRouter.entry else { return }

    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    window?.makeKeyAndVisible()
  }
}

