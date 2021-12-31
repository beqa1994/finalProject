//
//  CartVc.swift
//  Cars
//
//  Created by Beka Skhirtladze on 28.12.21.
//

import UIKit

class CartVc: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var cartDictionary = [String: [SelectCar]]()
    var carDictionary = [String: [SelectCar]]()
    var totalPrice = 0
    var finalPriceNumber = 0
    var myMoney = 50000
    
    @IBOutlet weak var service: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var comision: UILabel!
    
    @IBAction func pay(_ sender: UIButton) {
        performSegue(withIdentifier: "getPay", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PayVc {
            destination.wasSuccess = self.myMoney > self.finalPriceNumber
            if(self.myMoney > self.finalPriceNumber) {
                self.myMoney -= self.finalPriceNumber;
                self.finalPriceNumber = 0;
                //clearCart
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var servicePrice = totalPrice * 10 / 100
        var comision = 50
        self.service.text = String(servicePrice) + "$"
        self.comision.text = String(comision) + "$"
        self.finalPriceNumber = totalPrice + servicePrice + comision
        self.finalPrice.text = String(self.finalPriceNumber) + "$"
        
        self.cartDictionary = self.carDictionary.mapValues{ value in
            return value.filter{$0.quantity > 0 } }.filter({ !$0.value.isEmpty })
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        cartDictionary.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let myKey = Array(cartDictionary.keys)[section]
        return cartDictionary[myKey]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        let myKey = Array(cartDictionary.keys)[indexPath.section]
        print(myKey,indexPath.row, cartDictionary[myKey])
        let myModel = cartDictionary[myKey]![indexPath.row]
        cell.carMake.text = myModel.car.make
        cell.cartModel.text = myModel.car.model
        cell.cartHP.text = String(myModel.car.horsepower)
        cell.cartCarQuantity.text = String(myModel.quantity)+"X"
        cell.cartPrice.text = String(myModel.car.price)
        cell.cartTotalPrice.text = "სულ: "+String(myModel.car.price * myModel.quantity)
        if cell.carImage.image == nil{
            cell.carImage.image = UIImage()
        }
        
        
        
        
        URLSession.shared.dataTask(with: NSURL(string: myModel.car.img_url)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "no Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                cell.carImage.image = image
               
            })
            
        }).resume()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
 
    
    
  
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("Header", owner: nil, options: nil)?.first as? Header
        header?.headerText.text = Array(cartDictionary.keys)[section]
        header?.headerImage.image = UIImage.init(named: "\(Array(cartDictionary.keys)[section])_icon")
        return header
    }
    
    
   

}
