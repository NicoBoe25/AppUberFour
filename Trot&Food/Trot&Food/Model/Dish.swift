//
//  Dish.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 25/01/2021.
//

import Foundation

struct Dish: Codable {
    let name: String
    let description: String
    let price: Double
    let calories: Int
    let proteins: Int
    let carbs: Int
    let imageURL: String
}
