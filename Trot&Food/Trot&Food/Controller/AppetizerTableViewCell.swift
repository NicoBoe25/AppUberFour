//
//  AppetizerTableViewCell.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 01/02/2021.
//

import UIKit

class AppetizerTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var appetizerName: UILabel!
    @IBOutlet weak var appetizerPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImage.layer.cornerRadius = 10;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
