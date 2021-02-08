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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        bdDatePicker.maximumDate=Date()
        getUser()
    }
    
    @IBAction func imagineUneFonctionSave(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let dateBD = bdDatePicker.date
        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty  {
            let changeUser = User(firstName: firstName, lastName: lastName, email: email, dateOfBirth: dateBD, extraNapkins: extraNapkinsSwitch.isOn, frequentRefill: frequentRefillsSwitch.isOn)
            //Network manager
            //saveUser(User)
        }
    }
    
    func getUser(){
        NetworkManager.shared.getUser() { result in
            switch result{
            case .success(let user):
                self.user = user
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                let alert = TFAlert(title: "Oups", message: error.rawValue)
                
                DispatchQueue.main.async {
                    alert.showAlert(on: self)
                }
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
