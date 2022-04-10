//
//  HeadCollectionCellInsideTableViewCell.swift
//  Clothesline
//
//  Created by Никита Чирухин on 05.04.2022.
//

import UIKit

protocol ClotherCollectionViewCellDelegate: AnyObject {
    func leftScrollButtonTap()
    func rigthScrollButtonTap()
}

final class ClotherCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ClotherCollectionViewCellDelegate?
    
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
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteButtonTap), for: .touchUpInside)
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editButtonTap), for: .touchUpInside)
        button.setImage(UIImage(systemName: "pencil.circle"), for: .normal)
        return button
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
        contentView.addSubview(deleteButton)
        contentView.addSubview(editButton)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  .screenWidth / 4),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(.screenWidth / 4)),
            image.heightAnchor.constraint(equalToConstant: .screenWidth - 130),
            
            clothesName.topAnchor.constraint(equalTo: image.topAnchor, constant: -23),
            clothesName.leadingAnchor.constraint(equalTo: leadingAnchor),
            clothesName.trailingAnchor.constraint(equalTo: trailingAnchor),
            clothesName.heightAnchor.constraint(equalToConstant: 15),
            
            deleteButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 4),
            deleteButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -4),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
            
            editButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 4),
            editButton.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 4),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            editButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    @objc func deleteButtonTap() {
        
    }
    
    @objc func editButtonTap() {
        
    }
}

extension ClotherCollectionViewCell {
    func setData(viewData: ColletionClothesViewModel) {
        image.backgroundColor = viewData.color
        clothesName.text = viewData.name
        image.image = UIImage(named: ClothesImageSetupViewModel.clotherPickViewNames[viewData.type])
    }
}
