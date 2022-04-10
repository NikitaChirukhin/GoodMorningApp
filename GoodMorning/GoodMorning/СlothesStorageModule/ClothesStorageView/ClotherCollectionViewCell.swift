//
//  HeadCollectionCellInsideTableViewCell.swift
//  Clothesline
//
//  Created by Никита Чирухин on 05.04.2022.
//

import UIKit

final class ClotherCollectionViewCell: UICollectionViewCell {
    
    static let collectionIdentifier = "HeadCollectionIdentifier"
    
    private lazy var image: UIImageView = {
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
private extension ClotherCollectionViewCell {
    func setupView() {
        layer.cornerRadius = 5

        contentView.addSubview(image)
        contentView.addSubview(clothesName)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  .screenWidth / 4),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(.screenWidth / 4)),
            image.heightAnchor.constraint(equalToConstant: .screenWidth - 130),
            
            clothesName.topAnchor.constraint(equalTo: image.topAnchor, constant: -23),
            clothesName.leadingAnchor.constraint(equalTo: leadingAnchor),
            clothesName.trailingAnchor.constraint(equalTo: trailingAnchor),
            clothesName.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
}

extension ClotherCollectionViewCell {
    func setData(viewData: ColletionClothesViewModel) {
        image.backgroundColor = viewData.color
        clothesName.text = viewData.name
        image.image = UIImage(named: ClothesImageSetupViewModel.clotherPickViewNames[viewData.type])
    }
}
