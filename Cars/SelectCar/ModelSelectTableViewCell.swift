//
//  ModelSelectTableViewCell.swift
//  Cars
//
//  Created by Beka Skhirtladze on 27.12.21.
//

import UIKit

class ModelSelectTableViewCell: UITableViewCell {

    @IBOutlet weak var modelsMake: UILabel!
    @IBOutlet weak var modelsIcon: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
