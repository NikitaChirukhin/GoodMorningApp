//
//  HeadTableViewCell.swift
//  Clothesline
//
//  Created by Никита Чирухин on 05.04.2022.
//

import UIKit

protocol ClotherCollectionViewDelegate: AnyObject {
    func deleteButtonTap(key: String)
    func editButtonTap(key: String)
}

final class ClothesTableViewCell: UITableViewCell {
    
    static let clotherTableViewIdentifier = "headTableViewIdentifier"
    
    private var currentCell = 0
    
    private var dataViewModel: [ColletionClothesViewModel] = []
    
    weak var delegate: ClotherCollectionViewDelegate?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    private lazy var headCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ClotherCollectionViewCell.self,
                                forCellWithReuseIdentifier: ClotherCollectionViewCell.collectionIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = true
        return collectionView
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: HeadTableViewCell private methods
private extension ClothesTableViewCell {
    func setupView() {
        contentView.addSubview(headCollectionView)
        contentView.addSubview(deleteButton)
        contentView.addSubview(editButton)

        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            headCollectionView.topAnchor.constraint(equalTo: topAnchor),
            headCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
            
            editButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            editButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    @objc func deleteButtonTap() {
        delegate?.deleteButtonTap(key: dataViewModel[currentCell].name)
    }
    
    @objc func editButtonTap() {
        delegate?.editButtonTap(key: dataViewModel[currentCell].name)
    }
}

//MARK: - headCollectionView Delegate and DataSource methods
extension ClothesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClotherCollectionViewCell.collectionIdentifier, for: indexPath) as? ClotherCollectionViewCell else { return .init() }
        cell.setData(viewData: dataViewModel[indexPath.row])
        return cell
    }
    
}

extension ClothesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth, height: .screenWidth - 100)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentCell = Int(scrollView.contentOffset.x / .screenWidth)
    }
}

extension ClothesTableViewCell {
    func setData(data: [ColletionClothesViewModel]) {
        dataViewModel = data
        headCollectionView.reloadData()
    }
    
    func reloadData() {
        dataViewModel = []
        headCollectionView.reloadData()
    }
}
