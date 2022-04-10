//
//  HeadTableViewCell.swift
//  Clothesline
//
//  Created by Никита Чирухин on 05.04.2022.
//

import UIKit

final class ClothesTableViewCell: UITableViewCell {
    
    static let clotherTableViewIdentifier = "headTableViewIdentifier"
    
    private var currentCell = 0
    private let screenWidth = UIScreen.main.bounds.width
    private var dataViewModel: [ColletionClothesViewModel] = []
    
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


        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            headCollectionView.topAnchor.constraint(equalTo: topAnchor),
            headCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

//MARK: - headCollectionView Delegate and DataSource methods
extension ClothesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClotherCollectionViewCell.collectionIdentifier, for: indexPath) as? ClotherCollectionViewCell else { return .init() }
        cell.delegate = self
        cell.setData(viewData: dataViewModel[indexPath.row])
        return cell
    }
    
}

extension ClothesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: .screenWidth, height: .screenWidth - 100)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if CGFloat(currentCell) * screenWidth  < scrollView.contentOffset.x {
            currentCell += 1
        } else {
            currentCell -= 1
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if CGFloat(currentCell) * screenWidth < scrollView.contentOffset.x {
            currentCell += 1
        }
    }
}

//MARK: - ClothesCollectionViewCell delegate methods
extension ClothesTableViewCell: ClotherCollectionViewCellDelegate {
    func leftScrollButtonTap() {
        currentCell -= 1
        let indexPath = NSIndexPath(row: currentCell, section: 0)
        headCollectionView.scrollToItem(at: indexPath as IndexPath, at: .centeredVertically, animated: true)
        print(currentCell)
    }
    
    func rigthScrollButtonTap() {
        currentCell += 1
        let indexPath = NSIndexPath(row: currentCell, section: 0)
        headCollectionView.scrollToItem(at: indexPath as IndexPath, at: .centeredVertically, animated: true)
        print(currentCell)
    }
}

extension ClothesTableViewCell {
    func setData(data: [ColletionClothesViewModel]) {
        dataViewModel = data
    }
}
