//
//  AppetizerTableViewCell.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 01/02/2021.
//

import UIKit

class AppetizerTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: AppetizerImageView!
    @IBOutlet weak var appetizerName: UILabel!
    @IBOutlet weak var appetizerPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImage.layer.cornerRadius = 10;
        // Initialization code
    }
    
    func set(dish: Dish) {
        iconImage.downloadImage(from: dish.imageURL);
        appetizerName.text = dish.name;
        appetizerPrice.text = String(dish.price) + " €";
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
