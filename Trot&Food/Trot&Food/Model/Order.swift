//
//  Order.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 25/01/2021.
//

import Foundation

class Order {
    var dateOrder: Date
    let client: User
    var totalPrice: Double
    var dishes : [Dish]
        
    
    init(client: User) {
        self.client=client
        self.dateOrder=Date()
        self.totalPrice=0
        self.dishes=[]
    }
    
    func updateTotalPrice() {
        self.totalPrice = 0
        for dish in dishes {
            self.totalPrice+=dish.price
        }
    }
    
    func addDish(dish:Dish) -> Order {
        dishes.append(dish)
        updateTotalPrice()
        return self
    }
}
