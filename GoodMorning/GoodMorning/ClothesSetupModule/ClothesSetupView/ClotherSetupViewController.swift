//
//  ClotherSetupView.swift
//  Clothesline
//
//  Created by Никита Чирухин on 07.04.2022.
//

import UIKit

final class ClotherSetupViewController: UIViewController {
    
    var presenter: ClotherSetupPresenterProtocol!
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var clothesImageSetupView = ClothesImageSetupView()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "clothing name"
        textField.textAlignment = .center
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTap), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
}

//MARK: - ClotherSetupView private methods
private extension ClotherSetupViewController {
    func setupView() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(clothesImageSetupView)
        containerView.addSubview(nameTextField)
        containerView.addSubview(saveButton)
        
        let clothesImageSetupViewHeigth = (.screenWidth / 2) - 40 + (.screenWidth - 40 - 30) / 4 + (.screenWidth - 40 - 30) / 2 + 150
        let scrollViewHeigth = clothesImageSetupViewHeigth + 80 + 80 + 50
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalToConstant: .screenWidth),
            containerView.heightAnchor.constraint(equalToConstant: scrollViewHeigth),
            
            clothesImageSetupView.topAnchor.constraint(equalTo: containerView.topAnchor),
            clothesImageSetupView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            clothesImageSetupView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            clothesImageSetupView.heightAnchor.constraint(equalToConstant: clothesImageSetupViewHeigth),
            
            nameTextField.topAnchor.constraint(equalTo: clothesImageSetupView.bottomAnchor, constant: 30),
            nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            saveButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .screenWidth / 4 + 20),
            saveButton.widthAnchor.constraint(equalToConstant: .screenWidth / 2 - 40),
            saveButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc func saveButtonTap() {
        let data = clothesImageSetupView.getData()
        presenter.saveButtonTap(color: data.color, name: nameTextField.text, temperature: data.temperature, type: data.type)
    }
}

//MARK: - ClotherSetupViewProtocol methods
extension ClotherSetupViewController: ClothesSetupViewProtocol {
    func showAlert() {
        let alertController = UIAlertController(title: "Select all parametrs", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setParametrsIfNeeded() {
        clothesImageSetupView.setData(color: presenter.setColor(),
                                      temperature: presenter.setTemperature(),
                                      type: presenter.setType())
    }
}
