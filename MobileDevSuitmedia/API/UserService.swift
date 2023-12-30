//
//  UserService.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 30/12/23.
//

import Foundation

enum UserServiceError: Error {
    case serverError(UserError)
    case unknown(String = "An unknown error occured.")
    case decodingError(String = "Error parsing server response.")
}

class UserService {
    static func fetchCoins(with endpoint: Endpoint, completion: @escaping (Result<[Users], UserServiceError>)->Void) {
        guard let request = endpoint.request else { return }
        
        URLSession.shared.dataTask(with: request) { data, resp, error in
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                // TODO: - Handle error
                do {
                    let userError = try JSONDecoder().decode(UserError.self, from: data ?? Data())
                    completion(.failure(.serverError(userError)))
                } catch let err {
                    completion(.failure(.unknown()))
                    print(err.localizedDescription)
                }
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let userData = try decoder.decode(UsersData.self, from: data)
                    completion(.success(userData.data))
                } catch let err {
                    completion(.failure(.decodingError()))
                    print(err.localizedDescription)
                }
            } else {
                completion(.failure(.unknown()))
            }
        }.resume()
        
    }
}
