//
//  OrderTableViewCell.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 01/02/2021.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var iconDishIV: UIImageView!
    @IBOutlet weak var titleDishLabel: UILabel!
    @IBOutlet weak var priceDishLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
