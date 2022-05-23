//
//  ViewController.swift
//  PersistentLesson
//
//  Created by Ян Таше on 23.05.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var dataStoreManager = DataStoreManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = dataStoreManager.obtainMainUser()
        nameLabel.text = user.name! + " " + (user.company?.name ?? "")
        ageLabel.text = String(user.age)
        nameLabel.sizeToFit()
        ageLabel.sizeToFit()
        
        textField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        <#code#>
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

