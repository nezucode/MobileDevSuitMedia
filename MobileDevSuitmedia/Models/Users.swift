//
//  Users.swift
//  MobileDevSuitmedia
//
//  Created by Intan on 30/12/23.
//

import Foundation

struct UsersData: Decodable {
    let data: [Users]
}

struct Users: Decodable {
    
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    
    var avatar: URL? {
        return URL(string: "https://reqres.in/img/faces/\(id)-image.jpg")
    }
    
}
