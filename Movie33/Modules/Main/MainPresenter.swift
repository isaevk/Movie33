//
//  MainPresenter.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {
  
  weak var view: MainViewProtocol?
  var interactor: MainInteractorProtocol?
  var router: MainRouterProtocol?
  
  required init(view: MainViewProtocol) {
    self.view = view
  }
  
  func configureView() {
    view?.setBackgroundView(with: interactor!.setBackgroundColor)
  }
  
  func burgerButtonClicked() {
    router?.openBurgerMenu()
  }
  
  func filmClicked(with item: String) {
    interactor?.openAboutFilm(with: item)
  }
  
  
  
  
  
  func didFetchFilms(with result: Result<[Film], Error>) {
    
  }
  
  
}
