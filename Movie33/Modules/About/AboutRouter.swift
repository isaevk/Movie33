//
//  AboutRouter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

typealias AboutPoint = AboutViewProtocol & UIViewController

// MARK: - About Router Protocol
protocol AboutRouterProtocol {
  var entry: AboutPoint? { get }
  
  static func start() -> AboutRouterProtocol
  
  func closeCurrentViewController()
}

// MARK: - About Router class
final class AboutRouter: AboutRouterProtocol {
  var entry: AboutPoint?
  weak var view: AboutViewController?
  
  static func start() -> AboutRouterProtocol {
    let router: AboutRouter = AboutRouter()
    var view: AboutViewProtocol = AboutViewController()
    var presenter: AboutPresenterProtocol = AboutPresenter()
    var interactor: AboutInteractorProtocol = AboutInteractor()

    view.presenter = presenter
    interactor.presenter = presenter
    presenter.router = router
    presenter.view = view
    presenter.interactor = interactor
    router.entry = view as? AboutPoint
    
    return router
  }
  
  func closeCurrentViewController() {
    view?.dismiss(animated: true)
  }
}
