//
//  ViewController.swift
//  Cars
//
//  Created by Beka Skhirtladze on 24.12.21.
//

import UIKit

class ViewController: UIViewController {
    
 
    
   
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var alert: UILabel!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var top1: NSLayoutConstraint!
    
    
    @IBAction func deleteLogin(_ sender: UIButton) {
        login.text = nil
    }
    @IBAction func deletePassword(_ sender: UIButton) {
        password.text = nil
    }
    @IBAction func enterNextPage(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ModelsSelectVc" ) as? ModelsSelectVc
        if login.text == "beqa" && password.text == "beqa"{
            navigationController?.pushViewController(vc!, animated: true)
        }else{
            alert.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardIsOn(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardIsOff(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        login.layer.cornerRadius = 16
        login.layer.borderWidth = 2
        login.layer.borderColor = UIColor(red: 0.852, green: 0.859, blue: 0.913, alpha: 1).cgColor
        password.layer.cornerRadius = 16
        password.layer.borderWidth = 2
        password.layer.borderColor = UIColor(red: 0.852, green: 0.859, blue: 0.913, alpha: 1).cgColor
        enter.layer.cornerRadius = 10
        print(UIScreen.main.bounds.size)
        
    }
    
    @objc func keyBoardIsOn(_ notification: Notification) {
        UIView.animate(withDuration: 0.2) {
            //self.top.constant = 5
            //self.top1.constant = 100
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyBoardIsOff(_ notification: Notification){
        UIView.animate(withDuration: 0.2) {
            //self.top.constant = 10
           // self.top1.constant = 442
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func dismissKeyboard(){
       // print("endediting")
        self.view.endEditing(true)
    }
    
    
    
    
}
