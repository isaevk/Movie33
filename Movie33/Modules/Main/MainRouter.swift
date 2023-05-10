//
//  MainRouter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

typealias EntryPoint = MainViewProtocol & UIViewController

// MARK: - Main Router Protocol
protocol MainRouterProtocol {
  var entry: EntryPoint? { get }
  
  static func start() -> MainRouterProtocol
  func showAboutView(with movie: AboutMovie)
}

// MARK: - Main Router Class
final class MainRouter: MainRouterProtocol {
  var entry: EntryPoint?
  
  static func start() -> MainRouterProtocol {
    let router: MainRouter = MainRouter()
    let networkManager: NetworkManagerProtocol = NetworkManager()
    var view: MainViewProtocol = MainViewController()
    var presenter: MainPresenterProtocol = MainPresenter()
    var interactor: MainInteractorProtocol = MainInteractor(networkManager: networkManager)!
    
    view.presenter = presenter
    view.networkManager = networkManager
    interactor.presenter = presenter
    interactor.networkManager = networkManager
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPoint
    
    return router
  }

  func showAboutView(with movie: AboutMovie) {
    
    DispatchQueue.main.async { [weak self] in
      let aboutRouter = AboutRouter.start()
      guard let aboutViewController = aboutRouter.entry else { return }
      aboutViewController.update(with: movie)
      
      self?.entry?.navigationController?.pushViewController(aboutViewController, animated: true)
    }
  }
}
