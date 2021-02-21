//
//  OrderManager.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 21/02/2021.
//

import Foundation

class OrderManager {
    static var user: User?
    static var order: Order?
    
    static func newOrder() -> Bool {
        if let u = user {
            order = Order(client: u);
            return true;
        } else {
            return false;
        }
    }
    
}
