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
    
    var isSelected: Bool = false {
        didSet {
            isSelected ? viewSelected() : viewUnSelected()
        }
    }
    
    private lazy var layerView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    init(pictureName: String) {
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
        backgroundColor = .systemGray
        addSubview(layerView)
        translatesAutoresizingMaskIntoConstraints = false
        
        layerView.frame = CGRect(x: bounds.maxX + 10,
                                 y: bounds.midY + 10,
                                 width: 30,
                                 height: 30)
    }
    
    func viewSelected() {
        tintColor = .green
        layer.borderWidth = 2
        layer.borderColor = .init(red: 0, green: 1, blue: 0, alpha: 1)
        layerView.tintColor = .systemGreen
    }
    
    func viewUnSelected() {
        layer.borderWidth = 0
        layerView.tintColor = .systemBlue
    }
    
    func clickable() {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selected))
        addGestureRecognizer(tap)
    }
    @objc func selected() {
        delegate?.clothesViewPicked(imageName: "HZ")
    }
}
