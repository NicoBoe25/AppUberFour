//
//  AppetizerTableViewController.swift
//  Trot&Food
//
//  Created by Julien Da Silva Soares on 01/02/2021.
//

import UIKit

class AppetizerTableViewController: UITableViewController {
    
    var dishes: [Dish] = [
        Dish(name: "Lasagne", description: "Des bonnes lasagne", price: 7.99, calories: 3000, proteins: 20, carbs: 50, imageURL: "https://img.gaming.gentside.com/article/garfield/pourquoi-garfield-aime-autant-les-lasagnes_ca62216aec00b80f55bd58eeb1d11464762da5e9.jpg"),
        Dish(name: "Ratatouille", description: "Des ratatouilles qui te font revenir en enfance", price: 9.99, calories: 500, proteins: 2, carbs: 5, imageURL: "https://img.cinemablend.com/filter:scale/quill/e/7/8/1/0/0/e7810023b09d698743d524dfd3ed41cd905414d6.jpg?mw=600"),
        Dish(name: "Pizza au nutella", description: "Benvenuti a tutti chez Tony", price: 49.99, calories: 2500, proteins: 15, carbs: 100, imageURL: "https://static.750g.com/images/1200-630/ce0a02e481c26430660d871aaa0af818/pain-nutella.00-00-34-06.image-fixe006.jpg")
    ]
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet var tbView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.translatesAutoresizingMaskIntoConstraints = false;
        labelName.leadingAnchor.constraint(equalTo: tbView.leadingAnchor, constant: 20).isActive = true;
        
        NetworkManager.shared.getUser() { result in
            switch result{
            case .success(let users):
                DispatchQueue.main.async {
                    OrderManager.user = users[0];
                    OrderManager.newOrder();
                }
            case .failure(let error):
                let alert = TFAlert(title: "Oups", message: error.rawValue)
                
                DispatchQueue.main.async {
                    alert.showAlert(on: self)
                }
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dishes.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appetizerCell", for: indexPath) as! AppetizerTableViewCell;
        
        let dish = dishes[indexPath.row];
        cell.set(dish: dish);

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow;
        let dish = dishes[indexPath!.row];
        let details = segue.destination as! AppetizerViewController;
        
        details.dish = dish;
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue) {
        
    }

}
