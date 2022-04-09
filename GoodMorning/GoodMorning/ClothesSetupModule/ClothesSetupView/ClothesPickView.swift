//
//  ClothesPickView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 08.04.2022.
//

import UIKit

protocol ClothesPickViewDelegate: AnyObject {
    func clothesViewPicked(imageName: String)
}

final class ClothesPickView: UIView {
    
    weak var delegate: ClothesPickViewDelegate?
    
    private let screenWidth = Int(UIScreen.main.bounds.width)
    
    private var key: String
    
    var isSelected: Bool = false {
        didSet {
            isSelected ? viewSelected() : viewUnSelected()
        }
    }
    
    private lazy var layerView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    init(pictureName: String) {
        key = pictureName
        
        super.init(frame: .zero)

        layerView.image = UIImage(named: pictureName)
        clickable()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ClothesPickView private methods
private extension ClothesPickView {
    func setupView() {
        layer.cornerRadius = 12
        backgroundColor = .secondarySystemFill
        addSubview(layerView)
        translatesAutoresizingMaskIntoConstraints = false
        
        layerView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: (screenWidth - 40 - 30) / 4,
                                 height: (screenWidth - 40 - 30) / 4)
    }
    
    func viewSelected() {
        layer.borderWidth = 2
        layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func viewUnSelected() {
        layer.borderWidth = 0
    }
    
    func clickable() {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selected))
        addGestureRecognizer(tap)
    }
    @objc func selected() {
        delegate?.clothesViewPicked(imageName: key)
    }
}
