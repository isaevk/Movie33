//
//  MainRouter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

final class MainRouter: MainRouterProtocol {
  var entry: EntryPoint?
  
  static func start() -> MainRouterProtocol {
    var view: MainViewProtocol = MainViewController()
    var interactor: MainInteractorProtocol = MainInteractor()
    var presenter: MainPresenterProtocol = MainPresenter()
    let router = MainRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.router = router
    presenter.view = view
    router.entry = view as? EntryPoint
    
    return router
  }
}
