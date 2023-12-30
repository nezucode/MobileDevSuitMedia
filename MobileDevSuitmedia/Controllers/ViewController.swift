//
//  ViewController.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 29/12/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - UI Components
    private let nameField = CustomTextField(fieldType: .name)
    private let palindromeField = CustomTextField(fieldType: .palindrome)
    private let checkButton = CustomButton(title: "CHECK")
    private let nextButton = CustomButton(title: "NEXT")
    
    private let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        iv.image = UIImage(named: "frieren")
        iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    private let imagebgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "background")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        self.checkButton.addTarget(self, action: #selector(checkPalindrome), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        
        view.addSubview(imageView)
        view.addSubview(imagebgView)
        view.addSubview(nameField)
        view.addSubview(palindromeField)
        view.addSubview(checkButton)
        view.addSubview(nextButton)
        view.sendSubviewToBack(imagebgView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imagebgView.translatesAutoresizingMaskIntoConstraints = false
        nameField.translatesAutoresizingMaskIntoConstraints = false
        palindromeField.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            self.imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 100),
            self.imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),

            self.nameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            self.nameField.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            self.nameField.heightAnchor.constraint(equalToConstant: 48),
            self.nameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.palindromeField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            self.palindromeField.centerXAnchor.constraint(equalTo: nameField.centerXAnchor),
            self.palindromeField.heightAnchor.constraint(equalToConstant: 48),
            self.palindromeField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.checkButton.topAnchor.constraint(equalTo: palindromeField.bottomAnchor, constant: 36),
            self.checkButton.centerXAnchor.constraint(equalTo: palindromeField.centerXAnchor),
            self.checkButton.heightAnchor.constraint(equalToConstant: 48),
            self.checkButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.nextButton.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 16),
            self.nextButton.centerXAnchor.constraint(equalTo: checkButton.centerXAnchor),
            self.nextButton.heightAnchor.constraint(equalToConstant: 48),
            self.nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    private func isPalindrome(_ text: String) -> Bool {
        let inputSentence = text.components(separatedBy: .whitespaces).joined().lowercased()
        return inputSentence == String(inputSentence.reversed())
    }
    
    //MARK: - Selectors
    @objc func checkPalindrome(){
        guard let inputSentence = palindromeField.text else { return }
        
        let isPalindromic = isPalindrome(inputSentence)
        
        if (palindromeField.text != nil) == isPalindromic {
            let showInfo = UIAlertController(title: "Check", message: "It's palindrome.", preferredStyle: .alert)
            showInfo.addAction(UIAlertAction(title: "OK", style: .default))
            present(showInfo, animated: true)
        } else {
            let showInfo = UIAlertController(title: "Check", message: "It isn't a palindrome.", preferredStyle: .alert)
            showInfo.addAction(UIAlertAction(title: "OK", style: .default))
            present(showInfo, animated: true)
        }
        
    }
    
    @objc func nextPage(){
        guard let name = nameField.text else { return }
        let sc = SecondScreenViewController()
        sc.userClick = name
        let navVC = UINavigationController(rootViewController: sc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }


}

