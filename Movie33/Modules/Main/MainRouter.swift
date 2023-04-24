//
//  MainRouter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

protocol MainRouterProtocol {
  var entry: EntryPoint? { get }
  
  static func start() -> MainRouterProtocol
}

// Router
final class MainRouter: MainRouterProtocol {
  var entry: EntryPoint?
  
  static func start() -> MainRouterProtocol {
    let router: MainRouter = MainRouter()
    
    var view: MainViewProtocol = MainViewController()
    var presenter: MainPresenterProtocol = MainPresenter()
    var interactor: MainInteractorProtocol = MainInteractor()

    
    view.presenter = presenter
    
    interactor.presenter = presenter
//    interactor.getFilms()
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? EntryPoint
    
    return router
  }
}
