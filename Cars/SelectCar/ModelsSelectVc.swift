//
//  ModelsSelectVc.swift
//  Cars
//
//  Created by Beka Skhirtladze on 27.12.21.
//

import UIKit

class ModelsSelectVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var price = 0;
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var carsQuantity: UILabel!
    var carDictionary = [String: [SelectCar]]()
    
    @IBAction func clearCart(_ sender: UIButton) {
        for cars in self.carDictionary.values {
            for car in cars {
                car.quantity = 0
            }
        }
        totalPrice.text = "0$"
        carsQuantity.text = "0x"
    }
    @IBOutlet weak var totalPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            
            
            self.tableView.reloadData()
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        var quanti = 0
        self.price = 0
        for cars in self.carDictionary.values {
            for car in cars {
                quanti += car.quantity
                self.price += car.car.price * car.quantity
            }
        }
        self.carsQuantity.text = String(quanti)+"x"
        self.totalPrice.text = String(price)+"$"
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelSelectTableViewCell", for: indexPath) as! ModelSelectTableViewCell
        
        let myKeys = [String](self.carDictionary.keys).sorted()
        let myModels = myKeys[indexPath.row]
        
        cell.modelsMake.text = myModels//.capitalized 
        cell.modelsIcon.image = UIImage.init(named: "\(myModels)_icon")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectModelVc {
            let myKeys = [String](self.carDictionary.keys).sorted()
            let modelName = myKeys[(tableView.indexPathForSelectedRow?.row)!]
            destination.modelName = modelName
            destination.carModel = carDictionary[modelName]!
            
        }
        if let destination = segue.destination as? CartVc {
            destination.totalPrice = self.price
            destination.carDictionary = self.carDictionary

        }
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://private-anon-a41c950c16-carsapi1.apiary-mock.com/cars?fbclid=IwAR1XLP4o4H-QKDAl-S5WXuUOTkY41smtxKPMqgvJtFvLts1O6XhEd9GbEkM")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    let carModels = try JSONDecoder().decode([ModelData].self, from: data!)
                    for carModel in carModels {
                        self.carDictionary[carModel.make, default: []].append(SelectCar(quantity: 0, car: carModel))
                    }
               
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
                
            }
        }.resume()
    }
    
   
    
    @IBAction func navigateCartPage(_ sender: UIButton) {
        performSegue(withIdentifier: "goCart", sender: self)
        
    }



    
    
    
}








