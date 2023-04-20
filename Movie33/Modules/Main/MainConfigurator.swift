//
//  MainConfigurator.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import Foundation

final class MainConfigurator: MainConfiguratorProtocol {
  
  func configure(with viewController: MainViewController) {
    let presenter = MainPresenter(view: viewController)
    let interactor = MainInteractor(presenter: presenter)
    let router = MainRouter(viewController: viewController)
    
    viewController.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
  }
  
  
}
