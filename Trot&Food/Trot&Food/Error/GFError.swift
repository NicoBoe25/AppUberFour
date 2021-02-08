//
//  GFError.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 08/02/2021.
//

import Foundation


enum GFError: String, Error{
    case inavalidUser = "Invalid user"
    case unableToComplete = "Unable to complete your request"
    case invalidResponse = "Invalid response from he server"
    case invalidData = "Invalid data received  from the server"
}
