//
//  AboutPresenter.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import Foundation

// MARK: - About Presenter Protocol
protocol AboutPresenterProtocol {
  var router: AboutRouterProtocol? { get set }
  var interactor: AboutInteractorProtocol? { get set }
  var view: AboutViewProtocol? { get set }
  
  func didFetchTrailer(with result: Result<Video, Error>)
}

// MARK: - About Presenter class
final class AboutPresenter: AboutPresenterProtocol {
  var router: AboutRouterProtocol?
  var interactor: AboutInteractorProtocol?
  var view: AboutViewProtocol?
  
  func didFetchTrailer(with result: Result<Video, Error>) {
  }
}



