//
//  AppetizerViewController.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 01/02/2021.
//

import UIKit

class AppetizerViewController: UIViewController {
    
    var dish: Dish!

    @IBOutlet weak var displayImage: AppetizerImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var calProtCabsLabel: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayImage.layer.cornerRadius = 10;
        btnAdd.layer.cornerRadius = 10;
        
        displayImage.downloadImage(from: dish.imageURL);
        nameLabel.text = dish.name;
        descLabel.text = dish.description;
        calProtCabsLabel.text = "Calories: " + String(dish.calories) + " - Carbs: " + String(dish.carbs) + " - Proteins: " + String (dish.proteins);
        
        btnAdd.setTitle(String(dish.price) + " € - Add to Order", for: .normal)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addToOrder(_ sender: Any) {
        if let order = OrderManager.order {
            order.addDish(dish: dish);
        } else {
            OrderManager.newOrder();
            OrderManager.order!.addDish(dish: dish);
        }
        
        if let tabBarItems = tabBarController?.tabBar.items {
            let tabBarItem = tabBarItems[1];
            tabBarItem.badgeColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            if let order = OrderManager.order {
                if (order.dishes.count > 0) {
                    tabBarItem.badgeValue = String(order.dishes.count);
                } else {
                    tabBarItem.badgeValue = nil;
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
