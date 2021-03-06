//
//  User.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 25/01/2021.
//

import Foundation

struct User: Codable{
    let firstName: String
    let lastName: String
    let email: String
    let dateOfBirth: String
    let extraNapkins: Bool
    let frequentRefill: Bool
}
