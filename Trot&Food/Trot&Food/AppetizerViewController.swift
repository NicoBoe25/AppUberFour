//
//  AppetizerViewController.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 01/02/2021.
//

import UIKit

class AppetizerViewController: UIViewController {
    
    var dish: Dish!

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var calProtCabsLabel: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayImage.layer.cornerRadius = 10;
        btnAdd.layer.cornerRadius = 10;
        
        displayImage.image = UIImage(named: "NotFound");
        nameLabel.text = dish.name;
        descLabel.text = dish.description;
        calProtCabsLabel.text = "Calories: " + String(dish.calories) + " - Carbs: " + String(dish.carbs) + " - Proteins: " + String (dish.proteins);
        
        btnAdd.setTitle(String(dish.price) + " € - Add to Order", for: .normal)
        // Do any additional setup after loading the view.
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
