//
//  SecondScreenViewController.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 29/12/23.
//

import UIKit

class SecondScreenViewController: UIViewController {

    var userClick = "Hi, user!"
    var userSelectName = "Selected User Name"
    
    //MARK: - UI Components
    private let chooseButton = CustomButton(title: "Choose a User")
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Welcome"
        label.textColor = .systemGray
        return label
    }()
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let userSelectedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.text = "Hi, user"
        label.textColor = .black
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userLabel.text = userClick
        self.userSelectedLabel.text = userSelectName

        view.backgroundColor = .white
        self.navigationItem.title = "Second Screen"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapButton))
        self.chooseButton.addTarget(self, action: #selector(didTapChooseButton), for: .touchUpInside)
        
        setupUI()
    }
    
    //MARK: - Setup UI
    
    private func setupUI(){
        view.addSubview(welcomeLabel)
        view.addSubview(userLabel)
        view.addSubview(chooseButton)
        view.addSubview(userSelectedLabel)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        userSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),

            self.userLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            self.userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            
            self.userSelectedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.userSelectedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            self.chooseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            self.chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.chooseButton.heightAnchor.constraint(equalToConstant: 48),
            self.chooseButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
    
    //MARK: - Selectors
    @objc func didTapButton() {
        let _ = self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapChooseButton() {
        let tc = ThirdScreenViewController()
        let navVC = UINavigationController(rootViewController: tc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

}
