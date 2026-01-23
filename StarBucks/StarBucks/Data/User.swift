//
//  User.swift
//  StarBucks
//
//  Created by 한소희 on 1/22/26.
//

import Foundation

struct User {
    let userName: String
    let account: String
    
    static let shared = User(userName: "한담곰", account: "fast.campus")
}
