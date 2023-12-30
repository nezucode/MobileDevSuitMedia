//
//  UsersViewModels.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 30/12/23.
//

import Foundation
import UIKit

class UsersViewModel {
    var onUsersUpdated: (()-> Void)?
    var onErrorMessage: ((UserServiceError)-> Void)?
    
    // MARK: - Variables
    
    var users: [Users] = []
    
    private(set) var allUsers: [Users] = [] {
        didSet {
            self.onUsersUpdated?()
        }
    }
    
    // MARK: - Lifecycle
    
    init() {
        self.fetchCoins()
    }
    
    // MARK: - Functions
    
    public func removeCoin() {
        self.allUsers.remove(at: 0)
    }
    
    public func fetchCoins() {
        let endpoint = Endpoint.fetchUsers()
        
        UserService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let usr):
                self?.allUsers = usr
                print("DEBUG PRINT:", "\(usr.count) coin fethced.")
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
}

