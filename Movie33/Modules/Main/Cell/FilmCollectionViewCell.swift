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
    backgroundColor = .black
    posterImageView.image = UIImage(systemName: "star")
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
//      posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
      
      filmNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      filmNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      filmNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
      filmNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
    ])
  }
  
  // MARK: - Public methods
  
  func confugure(with film: Film) {
    filmNameLabel.text = film.originalTitle
  }
}
