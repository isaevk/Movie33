//
//  MainPresenter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

protocol MainPresenterProtocol {
  var router: MainRouterProtocol? { get set }
  var interactor: MainInteractorProtocol? { get set }
  var view: MainViewProtocol? { get set }
  
  func didFetchFilms(with result: Result<[Film], Error>)
}

// Presenter

final class MainPresenter: MainPresenterProtocol {
  var router: MainRouterProtocol?

  var interactor: MainInteractorProtocol? {
    didSet {
      self.interactor?.getFilms()
    }
  }
  
  var view: MainViewProtocol?
  
  func didFetchFilms(with result: Result<[Film], Error>) {
    print("load")
    switch result {
    case .success(let films):
      print("load")
      view?.update(with: films)
    case .failure:
      view?.update(with1: "Somthing went wrong")
    }
  }
}
