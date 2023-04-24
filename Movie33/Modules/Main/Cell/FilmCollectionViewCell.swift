//
//  FilmCollectionViewCell.swift
//  Movie33
//
//  Created by Kirill Dev on 20.04.2023.
//

import UIKit

final class FilmCollectionViewCell: UICollectionViewCell {
  static let identifier = "FilmCell"
  
  // MARK: - Private Properties
  
  private let posterImageView = UIImageView()
  private let filmNameLabel = UILabel()
  private let loglineLabel = UILabel()
  private let ratingLabel = UILabel()
  private let releaseDateLabel = UILabel()
  
  // MARK: - Override methods
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
    backgroundColor = .red
    
    
    filmNameLabel.font = .boldSystemFont(ofSize: 10)
    filmNameLabel.textColor = .white
    
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  
  private func setupConstraints() {
    [posterImageView, filmNameLabel, loglineLabel, ratingLabel, releaseDateLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
//      posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//      posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//      posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
//      posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
      posterImageView.widthAnchor.constraint(equalToConstant: 100),
      posterImageView.heightAnchor.constraint(equalToConstant: 100),
            filmNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            filmNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            filmNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            filmNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
      filmNameLabel.heightAnchor.constraint(equalToConstant:  30),
      filmNameLabel.widthAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  // MARK: - Public methods
  
  func confugure(with film: Film) {
    ImageDownloaderManager.shared.fetchImage(from: film.posterPath) { result in
      switch result {
      case .success(let image):
        self.posterImageView.image = image
      case .failure:
        self.posterImageView.image = UIImage(systemName: "shareplay.slash")
      }
    }
    guard let name = film.originalTitle else { return }
          filmNameLabel.text = name
    }
  }

