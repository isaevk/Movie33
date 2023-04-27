//
//  MainPresenter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

// MARK: - Main Presenter Protocol
protocol MainPresenterProtocol {
  var router: MainRouterProtocol? { get set }
  var interactor: MainInteractorProtocol? { get set }
  var view: MainViewProtocol? { get set }
  
  func didFetchMovie(with result: Result<[Movie], Error>)
  
  func selectedUpcomingMovies()
  func selectedPopularMovies()
  func selectedTopRatingMovie()
  
  func movieCellClicked(with movie: AboutMovie)
}

// MARK: - Main Presenter Class
final class MainPresenter: MainPresenterProtocol {
  var router: MainRouterProtocol?
  var view: MainViewProtocol?
  
  var interactor: MainInteractorProtocol? {
    didSet {
      self.interactor?.getPopularMovies()
    }
  }
  
  // First fetching
  func didFetchMovie(with result: Result<[Movie], Error>) {
    switch result {
    case .success(let films):
      view?.update(with: films)
    case .failure:
      view?.update(with: "Somthing went wrong")
    }
  }
  
  // View selected popular movies
  func selectedPopularMovies() {
    interactor?.getPopularMovies()
  }
  
  // View selected upcoming movies
  func selectedUpcomingMovies() {
    interactor?.getUpcomingMovies()
  }
  
  // View selected top rating movies
  func selectedTopRatingMovie() {
    interactor?.getTopRatingMovies()
  }
  
  // View tap movie cell
  func movieCellClicked(with movie: AboutMovie) {
      router?.showAboutView(with: movie)
  }
}
