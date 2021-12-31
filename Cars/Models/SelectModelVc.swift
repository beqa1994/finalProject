//
//  SelectModelVc.swift
//  Cars
//
//  Created by Beka Skhirtladze on 27.12.21.
//

import UIKit

class SelectCar {
    var quantity = 0
    var car : ModelData!
    
    init(quantity: Int, car: ModelData) {
        self.quantity = quantity
        self.car = car
    }
}

class SelectModelVc: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelsTableViewCellDelegate {
    
    
    func addCar(cell: ModelsTableViewCell) {
        let index = selectTableView.indexPath(for: cell)
        var car = carModel[index!.row]
        car.quantity += 1
        print(car.car)
        selectTableView.reloadData()
    }
    
    func removeCar(cell: ModelsTableViewCell) {
        let index = selectTableView.indexPath(for: cell)
        var car = carModel[index!.row]
        car.quantity -= 1
        if(car.quantity < 0) {
            car.quantity = 0
        }
        selectTableView.reloadData()
    }
    
   
    
    @IBOutlet weak var selectTableView: UITableView!
    
    var carModel = [SelectCar]()
    
    @IBAction func priceIsIncreasing(_ sender: UIButton) {
    }
    
    @IBAction func priceDescending(_ sender: Any) {
    }
    
    
    
    @IBOutlet weak var makeName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var modelName : String?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeName.text = modelName
    }

    
    @IBOutlet weak var sortControl: UIButton!
    
    @IBAction func sortAlphabet(_ sender: Any) {
//        var itemSort = carModel
//        itemSort.sort(by: { $0.model < $1.model})
//        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelsTableViewCell", for: indexPath) as! ModelsTableViewCell
        let carsModels = carModel[indexPath.row]
        //var modelebisArray = [ModelData]()
        cell.carsPrice.text = String(carsModels.car.price)
        cell.modelLbl.text = carsModels.car.model
        cell.modelsTitle.text = carsModels.car.make
        cell.modelsHP.text = String(carsModels.car.horsepower)
        cell.quantity.text = String(carsModels.quantity)
        cell.cellDelegate = self
        if cell.modelsImage.image == nil{
            cell.modelsImage.image = UIImage()
        }
        
        
      //  print("cell created----------------------",indexPath.row)
        
        
        URLSession.shared.dataTask(with: NSURL(string: carsModels.car.img_url)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "no Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                cell.modelsImage.image = image
               // print("image assigned",indexPath.row)
            })
            
        }).resume()
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
 
}










