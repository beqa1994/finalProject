//
//  PayVc.swift
//  Cars
//
//  Created by Beka Skhirtladze on 31.12.21.
//

import UIKit

class PayVc: UIViewController {
    
    var wasSuccess : Bool!
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusText: UILabel!
    
    
    override func viewDidLoad() {
        print(wasSuccess)
        if(wasSuccess) {
            self.statusText.text = "გადახდა წარმატებით შესრულდა"
            self.statusImage.image = UIImage.init(named: "yes")
        } else {
            self.statusText.text = "სამწუხაროდ გადახდა ვერ მოხერხდა, სცადეთ თავიდან"
            self.statusImage.image = UIImage.init(named: "no")
        }
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    


}
