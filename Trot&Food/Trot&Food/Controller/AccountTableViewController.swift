//
//  AccountTableViewController.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 01/02/2021.
//

import UIKit

class AccountTableViewController: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bdDatePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var extraNapkinsSwitch: UISwitch!
    @IBOutlet weak var frequentRefillsSwitch: UISwitch!
    
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bdDatePicker.maximumDate=Date()
        getUser()
        
    }
    
    @IBAction func imagineUneFonctionSave(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let dateBD = bdDatePicker.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dateString = dateFormatter.string(from: dateBD)

        
        
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty  {
            let changeUser = User(firstName: firstName, lastName: lastName, email: email, dateOfBirth: dateString,extraNapkins: extraNapkinsSwitch.isOn, frequentRefill: frequentRefillsSwitch.isOn
            )
            //Network manager
            //saveUser(User)
        }
    }
    
    func getUser(){
        NetworkManager.shared.getUser() { result in
            switch result{
            case .success(let users):
                self.user = users[0]
                DispatchQueue.main.async {
                    self.afficheUserPropriety(user: self.user!)
                    OrderManager.user = self.user;
                }
            case .failure(let error):
                let alert = TFAlert(title: "Oups", message: error.rawValue)
                
                DispatchQueue.main.async {
                    alert.showAlert(on: self)
                }
            }
        }
    }
    
    func afficheUserPropriety(user: User){
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        emailTextField.text = user.email
        
        let isoDate = user.dateOfBirth

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        bdDatePicker.date = dateFormatter.date(from: isoDate) ?? Date()

        extraNapkinsSwitch.setOn(user.extraNapkins, animated: true)
        frequentRefillsSwitch.setOn(user.frequentRefill, animated: true)

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
