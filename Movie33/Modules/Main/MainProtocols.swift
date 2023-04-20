//
//  MainProtocols.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

//import Foundation
import UIKit

// MARK: - Configurator Protocol

protocol MainConfiguratorProtocol: AnyObject {
  func configure(with viewController: MainViewController)
}

// MARK: - Router Protocol

protocol MainRouterProtocol: AnyObject {
  func openBurgerMenu()
}

// MARK: - Presenter Protocol

protocol MainPresenterProtocol: AnyObject {
  var view: MainViewProtocol? { get set }
  var router: MainRouterProtocol? { get set }
  var interactor: MainInteractorProtocol? { get set }
  
  func configureView()
  func burgerButtonClicked()
  func filmClicked(with item: String)
}


// MARK: - View Protocol

protocol MainViewProtocol: AnyObject {
  var presenter: MainPresenterProtocol? { get set }
  
  func setBackgroundView(with color: UIColor)
  func setBurgerSidemenu(with navItem: UINavigationItem)
}

// MARK: - Interactor Protocol

protocol MainInteractorProtocol: AnyObject {
  var presenter: MainPresenterProtocol? { get set }
  
  var setBackgroundColor: UIColor { get }
  
  func openAboutFilm(with urlString: String)
}


