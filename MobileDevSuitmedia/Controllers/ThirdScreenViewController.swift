//
//  ThirdScreenViewController.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 30/12/23.
//

import UIKit

class ThirdScreenViewController: UIViewController {
    
    // MARK: - Variables
    private let viewModel: UsersViewModel
    
    var users: [Users] = []
    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        return tv
    }()
    
    // MARK: - LifeCycle
    init(_ viewModel: UsersViewModel = UsersViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.viewModel.onUsersUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        self.viewModel.onErrorMessage = { [weak self] error in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                switch error {
                case .serverError(let serverError):
                    alert.title = "Server error \(serverError.errorCode)"
                case .unknown(let string):
                    alert.title = "Error Fetching Coins"
                    alert.message = string
                case .decodingError(let string):
                    alert.title = "Error Parsing Data"
                    alert.message = string
                }
                self?.present(alert, animated: true)
            }
        }
    }
    
    private func setupUI(){
        self.navigationItem.title = "Third Screnn"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(didTapButton))
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    //MARK: - Selectors
    @objc func didTapButton() {
        let _ = self.dismiss(animated: true, completion: nil)
    }
}



// MARK: - TableView Functions

extension ThirdScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell else {
            fatalError("Unable to dequeue CoinCell in HomeController")
        }
        
        let usr = self.viewModel.users[indexPath.row]
        cell.configure(with: usr)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
//        let inSearchMode = self.viewModel.inSearchMode(searchController)
//        let coin = inSearchMode ? self.viewModel.filteredCoins[indexPath.row] : self.viewModel.allCoins[indexPath.row]
//        let vm = ViewCryptoControllerViewModel(coin: coin)
//        let vc = ViewCryptoController(vm)
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
