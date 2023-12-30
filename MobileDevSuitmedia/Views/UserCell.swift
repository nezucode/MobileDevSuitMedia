//
//  UserCell.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 30/12/23.
//

import UIKit
import SDWebImage

class UserCell: UITableViewCell {
    
    static let identifier = "UserCell"
    
    // MARK: - Variables
    private(set) var user: Users!
    
    // MARK: - UI Components
    private let userAvatar: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .black
        return iv
    }()
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with users: Users) {
        self.user = users
        
        self.userLabel.text = users.first_name
        self.userAvatar.sd_setImage(with: users.avatar)
        
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.addSubview(userAvatar)
        self.addSubview(userLabel)
        self.addSubview(emailLabel)
        
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userAvatar.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userAvatar.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            userAvatar.heightAnchor.constraint(equalToConstant: 50),
            userAvatar.widthAnchor.constraint(equalToConstant: 50),
            
            userLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 12),
            userLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

