//
//  CartTableViewCell.swift
//  Cars
//
//  Created by Beka Skhirtladze on 28.12.21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var cartModel: UILabel!
    @IBOutlet weak var cartHP: UILabel!
    @IBOutlet weak var carMake: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartTotalPrice: UILabel!
    @IBOutlet weak var cartCarQuantity: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
