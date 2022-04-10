//
//  LoadImage.swift
//  GoodMorning
//
//  Created by Никита Чирухин on 10.04.2022.
//

import UIKit

final class LoadImage: UIView {

    private lazy var sunImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sun")
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
private extension LoadImage {
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(sunImage)
        backgroundColor = .systemYellow
        
        NSLayoutConstraint.activate([
            sunImage.topAnchor.constraint(equalTo: topAnchor),
            sunImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            sunImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            sunImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
