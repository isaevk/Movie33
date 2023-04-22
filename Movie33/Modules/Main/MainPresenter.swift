//
//  MainPresenter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {
  var view: MainViewProtocol?
  var router: MainRouterProtocol?
  
  var interactor: MainInteractorProtocol? {
    didSet {
      self.interactor?.getFilms()
    }
  }

  
  func didFetchFilms(with result: Result<[Film], Error>) {
    switch result {
    case .success(let films):
      view?.update(with: films)
    case .failure:
      view?.update(with: "Somthing went wrong")
    }
    
    
  }
  
//  init() {
//    interactor?.getFilms()
//  }
}
