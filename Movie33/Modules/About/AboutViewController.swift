//
//  AboutViewController.swift
//  Movie33
//
//  Created by Kirill Dev on 22.04.2023.
//

import UIKit
import WebKit

// MARK: - About View Protocol
protocol AboutViewProtocol {
  var presenter: AboutPresenterProtocol?  { get set }
  
  func update(with movies: AboutMovie)
}

// MARK: - About View Class
final class AboutViewController: UIViewController {
  
  // MARK: - Public Properties
  var presenter: AboutPresenterProtocol?
  
  // MARK: - Private Properties
  private var trailerWebView = WKWebView()
  private let nameLabel = UILabel()
  private let owerviewLabel = UILabel()
  private let originalNameLabel = UILabel()
  private let releaseDateLabel = UILabel()
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewDidLayoutSubviews()  {
    super.viewDidLayoutSubviews()
    setupConstraints()
  }
  
  // MARK: - Private Methods
  private func setupView() {
    view.backgroundColor = .systemCyan
    setupLabels()
  }
}

// MARK: - Settings
private extension AboutViewController {
  
  // Labels
  func setupLabels() {
    nameLabel.font = .systemFont(ofSize: 22, weight: .bold)
    nameLabel.numberOfLines = 0
    
    owerviewLabel.font = .systemFont(ofSize: 18, weight: .regular)
    owerviewLabel.numberOfLines = 0
    
    originalNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
    originalNameLabel.numberOfLines = 0
    
    releaseDateLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    releaseDateLabel.textColor = .systemPink
  }
  
  // Constraints
  func setupConstraints() {
    [trailerWebView, owerviewLabel, nameLabel, originalNameLabel, releaseDateLabel].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      trailerWebView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      trailerWebView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
      trailerWebView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
      trailerWebView.heightAnchor.constraint(equalToConstant: 250),
      
      nameLabel.topAnchor.constraint(equalTo: trailerWebView.bottomAnchor, constant: 20),
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      nameLabel.widthAnchor.constraint(equalToConstant: 300),
      
      owerviewLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
      owerviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      owerviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      
      originalNameLabel.topAnchor.constraint(equalTo: owerviewLabel.bottomAnchor, constant: 20),
      originalNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
      originalNameLabel.widthAnchor.constraint(equalToConstant: 300),
      
      releaseDateLabel.topAnchor.constraint(equalTo: originalNameLabel.bottomAnchor, constant: 10),
      releaseDateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
    ])
  }
}

// MARK: - AboutViewProtocol
extension AboutViewController: AboutViewProtocol {
  
  func update(with movie: AboutMovie) {
    guard let url = URL(string: "\(URLs.baseYouTubeView)\(movie.youtubeView.id.videoId)") else { return }
    self.trailerWebView.load(URLRequest(url: url))
    
    nameLabel.text = movie.nameMovie
    owerviewLabel.text = movie.overviewMovie
    originalNameLabel.text = "Original title: \(movie.originalName)"
    releaseDateLabel.text = "Movie release date: \(movie.releaseDate)"
  }
}
