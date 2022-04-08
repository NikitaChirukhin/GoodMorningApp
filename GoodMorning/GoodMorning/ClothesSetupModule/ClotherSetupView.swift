//
//  ClotherSetupView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import UIKit

final class ClotherSetupView: UIViewController {
    
    private let screenWidth = UIScreen.main.bounds.width
    
    private lazy var clotherImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "shoe.png")
        image.backgroundColor = .systemPink
        image.layer.cornerRadius = (screenWidth - 40) / 2
        return image
    }()
    
    private lazy var clotherPickViewNames = ["hat", "coat", "pant", "shoe"]
    private lazy var clotherPickViews: [ClothesPickView] = []
    
    private lazy var stackClotherPickViews: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

//MARK: - ClotherSetupView private methods
private extension ClotherSetupView {
    func setupView() {
        view.backgroundColor = .systemMint
        view.addSubview(stackClotherPickViews)
        
        view.addSubview(clotherImage)
        for name in clotherPickViewNames {
            clotherPickViews.append(setupClothesPickView(pictureName: name))
        }
        
        NSLayoutConstraint.activate([
            clotherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clotherImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            clotherImage.heightAnchor.constraint(equalToConstant: screenWidth - 40),
            clotherImage.widthAnchor.constraint(equalToConstant: screenWidth - 40),
            
            stackClotherPickViews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackClotherPickViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackClotherPickViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackClotherPickViews.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupClothesPickView(pictureName: String) -> ClothesPickView {
        let view = ClothesPickView(pictureName: pictureName)
        stackClotherPickViews.addArrangedSubview(view)
        view.delegate = self
        return view
    }
}

//MARK: - ClotherSetupViewProtocol methods
extension ClotherSetupView: ClotherSetupViewProtocol {
    
}

extension ClotherSetupView: ClothesPickViewDelegate {
    func clothesViewPicked(imageName: String) {
        
    }
}
