//
//  ModelsTableViewCell.swift
//  Cars
//
//  Created by Beka Skhirtladze on 26.12.21.
//

protocol ModelsTableViewCellDelegate: class{
    func addCar(cell:ModelsTableViewCell)
    func removeCar(cell:ModelsTableViewCell)
}

import UIKit

class ModelsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var modelsTitle: UILabel!
    @IBOutlet weak var modelsImage: UIImageView!
    @IBOutlet weak var modelsHP: UILabel!
    
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var modelTableCell: UIView!
    
   
    @IBOutlet weak var carsPrice: UILabel!
    
    weak var cellDelegate: ModelsTableViewCellDelegate!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func addCar(_ sender: UIButton) {
        cellDelegate.addCar(cell: self)
    }
    
    @IBAction func removeCar(_ sender: UIButton) {
        cellDelegate.removeCar(cell: self)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
