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
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "trash")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .brown
        return image
    }()
    
    private lazy var scrollLeftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(leftScrollButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var scrollRightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.addTarget(self, action: #selector(rightScrollButtonTap), for: .touchUpInside)
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
        
        contentView.addSubview(scrollLeftButton)
        contentView.addSubview(scrollRightButton)
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: screenWidth / 2),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollLeftButton.topAnchor.constraint(equalTo: topAnchor),
            scrollLeftButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollLeftButton.trailingAnchor.constraint(equalTo: image.leadingAnchor),
            scrollLeftButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            scrollRightButton.topAnchor.constraint(equalTo: topAnchor),
            scrollRightButton.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            scrollRightButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollRightButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    @objc func leftScrollButtonTap() {
        delegate?.leftScrollButtonTap()
    }
    @objc func rightScrollButtonTap(){
        delegate?.rigthScrollButtonTap()
    }
}
