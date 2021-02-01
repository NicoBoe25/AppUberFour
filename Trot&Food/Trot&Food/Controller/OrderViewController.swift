//
//  OrderViewController.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 01/02/2021.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var nothingInOrderLabel: UILabel!
    var order: Order?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ord = order {
            ord.updateTotalPrice()
            placeOrderButton.setTitle(String(ord.totalPrice)+" € - Place Order", for: .normal)
            nothingInOrderLabel.isHidden = true
        }else{
            placeOrderButton.isHidden = true
        }
        
        placeOrderButton.layer.cornerRadius=10
        
        

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return order?.dishes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderTableViewCell
        
        let dish = order?.dishes[indexPath.row]
        
        cell.titleDishLabel.text = dish?.name ?? "N/A"
        cell.priceDishLabel.text = String(dish?.price ?? 0)+" €"
        cell.iconDishIV.image = UIImage(named: "NotFound")
        
        
        return cell
    }
    
    
}
