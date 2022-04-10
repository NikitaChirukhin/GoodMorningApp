//
//  СlothesStorageView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

final class СlothesStorageViewController: UIViewController {
    
    var presenter: СlothesStoragePresenterProtocol!
    
    private var randomAction: Int = 3
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ClothesTableViewCell.self, forCellReuseIdentifier: ClothesTableViewCell.clothesTableViewIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .black
        tableView.backgroundColor = .systemGray2
        return tableView
    }()
    
    private lazy var navigationAddButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem()
        navButton.image = UIImage(systemName: "plus")
        navButton.target = self
        navButton.action = #selector(addButtonTap)
        navButton.tintColor = .white
        return navButton
    }()
    
    private lazy var navigationRandomButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem()
        navButton.image = UIImage(systemName: "dice")
        navButton.target = self
        navButton.action = #selector(randomButtonTap)
        navButton.tintColor = .white
        return navButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupСlothesStorageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.tabBarItem.badgeColor = .systemGray
        navigationController?.navigationBar.barTintColor = .systemGray
        
        presenter.viewNeedNewData()
        
        mainTableView.reloadData()
    }
}

//MARK: - СlothesStorageViewProtocol Methods
extension СlothesStorageViewController: СlothesStorageViewProtocol {

}

//MARK: - СlothesStorageView private Methods
private extension СlothesStorageViewController {
    func setupСlothesStorageView() {
        view.addSubview(mainTableView)
        view.backgroundColor = .systemGray2
        
        navigationItem.leftBarButtonItem = navigationRandomButton
        navigationItem.rightBarButtonItem = navigationAddButton
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func addButtonTap() {
        presenter.navigationAddButtonTap()
    }
    @objc func randomButtonTap() {
        randomAction = 0
        mainTableView.reloadData()
    }
}

//MARK: - clothresStorageCollectionView UITableViewDelegate
extension СlothesStorageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClothesTableViewCell.clothesTableViewIdentifier, for: indexPath) as? ClothesTableViewCell else { fatalError("Problem cell") }
        cell.reloadData()
        cell.setData(data: presenter.clothesItemBykey(key: indexPath.row))
        if randomAction != 4 {
            cell.setRandomRaw()
            randomAction += 1
        }
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .screenWidth - 80
    }
}

//MARK: - ClothesCollectionViewCell delegate methods
extension СlothesStorageViewController: ClothesCollectionViewDelegate {
    func deleteButtonTap(key: String) {
        presenter.deleteButtonTap(key: key)
    }
    
    func editButtonTap(key: String) {
        presenter.editButtonTap(key: key)
    }
}
