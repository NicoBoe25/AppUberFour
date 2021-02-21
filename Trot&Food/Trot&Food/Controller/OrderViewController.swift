//
//  OrderViewController.swift
//  Trot&Food
//
//  Created by boehrer nicolas on 01/02/2021.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var nothingInOrderLabel: UILabel!
    var order = OrderManager.order;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        self.order = OrderManager.order;
        
        checkOrder()
        
        placeOrderButton.layer.cornerRadius=10

        // Do any additional setup after loading the view.
    }
    
    func checkOrder() {
        if let ord = self.order {
            if (ord.dishes.count > 0) {
                ord.updateTotalPrice()
                placeOrderButton.setTitle(String(format: "%.2f", ord.totalPrice)+" € - Place Order", for: .normal)
                placeOrderButton.isHidden = false;
                nothingInOrderLabel.isHidden = true
                view.bringSubviewToFront(placeOrderButton);
            }else{
                nothingInOrderLabel.isHidden = false;
                placeOrderButton.isHidden = true
            }
        }else{
            nothingInOrderLabel.isHidden = false;
            placeOrderButton.isHidden = true
        }
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
        checkOrder();
        return self.order?.dishes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            order?.dishes.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: .fade);
            if (order!.dishes.count > 0) {
                tabBarItem.badgeValue = String(order!.dishes.count);
            } else {
                tabBarItem.badgeValue = nil;
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderTableViewCell
        
        let dish = self.order?.dishes[indexPath.row]
        
        cell.set(dish: dish!);
        
        return cell
    }
    
    
}
