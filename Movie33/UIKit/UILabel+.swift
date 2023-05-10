//
//  UILabel+.swift
//  Movie33
//
//  Created by Kirill Dev on 25.04.2023.
//

import UIKit

// MARK: Cotom Title For Nav Bar
final class CustomTitle: UILabel {
  
  init(title: String) {
    super.init(frame: .zero)
    setupSelfLabel(title: title)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupSelfLabel(title: String) {
    text = title
    frame = CGRect(x: 5, y: 0, width: 140, height: 25)
    font = .boldSystemFont(ofSize: 29)
    textColor = .systemGray6
  }
}
