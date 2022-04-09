//
//  СlothesStorageView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 31.03.2022.
//

import UIKit

final class СlothesStorageView: UIViewController {
    
    var presenter: СlothesStoragePresenterProtocol!
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ClothesTableViewCell.self, forCellReuseIdentifier: ClothesTableViewCell.clotherTableViewIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
    
    private lazy var navigationAddButton: UIBarButtonItem = {
        let navButton = UIBarButtonItem()
        navButton.image = UIImage(systemName: "plus")
        navButton.target = self
        navButton.action = #selector(addButtonTap)
        return navButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupСlothesStorageView()
    }
}

//MARK: - СlothesStorageViewProtocol Methods
extension СlothesStorageView: СlothesStorageViewProtocol {
    
}

//MARK: - СlothesStorageView private Methods
private extension СlothesStorageView {
    func setupСlothesStorageView() {
        view.addSubview(mainTableView)
        
        view.backgroundColor = .systemBackground
        
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
}

//MARK: - clothresStorageCollectionView UITableViewDelegate
extension СlothesStorageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClothesTableViewCell.clotherTableViewIdentifier, for: indexPath) as? ClothesTableViewCell else { fatalError("Problem cell") }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.height / 5 
    }
}
