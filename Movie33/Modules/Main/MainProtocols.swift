//
//  MainProtocols.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit

typealias EntryPoint = MainViewProtocol & UIViewController

// MARK: - View

//protocol MainViewProtocol {
//  var presenter: MainPresenterProtocol?  { get set }
//  
//  func update(with films: [Film])
//  func update(with1 error: String)
//}

// MARK: - Interactor

//protocol MainInteractorProtocol {
//  var presenter: MainPresenterProtocol? { get set }
//  
//  func getFilms()
//}

// MARK: - Presenter

//protocol MainPresenterProtocol {
//  var router: MainRouterProtocol? { get set }
//  var interactor: MainInteractorProtocol? { get set }
//  var view: MainViewProtocol? { get set }
//  
//  func didFetchFilms(with result: Result<[Film], Error>)
//}

// MARK: - Router

//protocol MainRouterProtocol {
//  var entry: EntryPoint? { get }
//  
//  static func start() -> MainRouterProtocol
//}
