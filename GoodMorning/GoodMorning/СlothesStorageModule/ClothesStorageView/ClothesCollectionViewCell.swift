//
//  HeadCollectionCellInsideTableViewCell.swift
//  Clothesline
//
//  Created by Никита Чирухин on 05.04.2022.
//

import UIKit

final class ClothesCollectionViewCell: UICollectionViewCell {
    
    static let collectionIdentifier = "HeadCollectionIdentifier"
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var clothesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        return image
    }()
    
    private lazy var clothesName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - HeadCollectionCellInsideTableViewCell private methods
private extension ClothesCollectionViewCell {
    func setupView() {
        layer.cornerRadius = 5

        contentView.addSubview(clothesImage)
        contentView.addSubview(clothesName)
        contentView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            clothesImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            clothesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  .screenWidth / 4),
            clothesImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(.screenWidth / 4)),
            clothesImage.heightAnchor.constraint(equalToConstant: .screenWidth - 130),
            
            clothesName.topAnchor.constraint(equalTo: clothesImage.topAnchor, constant: -23),
            clothesName.leadingAnchor.constraint(equalTo: leadingAnchor),
            clothesName.trailingAnchor.constraint(equalTo: trailingAnchor),
            clothesName.heightAnchor.constraint(equalToConstant: 15),
            
            temperatureLabel.topAnchor.constraint(equalTo: clothesImage.topAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: clothesImage.trailingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ClothesCollectionViewCell {
    func setData(viewData: ColletionClothesViewModel) {
        clothesImage.backgroundColor = viewData.color
        clothesName.text = viewData.name
        clothesImage.image = UIImage(named: ClothesImageSetupViewModel.clothesPickViewNames[viewData.type])
        if viewData.temperature >= "0" {
            temperatureLabel.textColor = .red
        } else {
            temperatureLabel.textColor = .blue
        }
        temperatureLabel.text = "\(viewData.temperature)°"
    }
}
