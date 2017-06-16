//
//  ShoppersListTableViewController.swift
//  DemoAccessibilityRotor
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 2/2/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

class ShoppersListTableViewController: UITableViewController {
    
   private var stores:[Store] = []
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // creating stores and initilising with values
        
        self.setUpStoreModel()
        
        let offersRotor = UIAccessibilityCustomRotor(name: "Special Offers") { predicate in
            
            let forwards = predicate.searchDirection == .next
            var currentRow = forwards ? -1 : self.stores.count
            
            if let currentElement = predicate.currentItem.targetElement {
                if let cell = currentElement as? UITableViewCell {
                    currentRow = self.tableView.indexPath(for: cell)?.row ??
                    currentRow
                    
                }
                
                // helper for search
                
                let nextSearchRow = {(row:Int) -> Int in forwards ? row + 1 : row-1}
                
                // search for a offer in the correct direction
                
                var searchRow = nextSearchRow(currentRow)
                
                while searchRow >= 0 && searchRow < self.stores.count {
                    if self.stores[searchRow].hasSpecialOffers {
                        
                        let indexPath = IndexPath(row: searchRow, section: 0)
                        self.tableView.scrollToRow(at: indexPath, at: .none, animated: false)
                        let cell = self.tableView.cellForRow(at: indexPath)!
                        return UIAccessibilityCustomRotorItemResult(targetElement: cell, targetRange: nil)
                    }
                    searchRow = nextSearchRow(searchRow)
                }
            }
            
            return nil
        }
        
        self.accessibilityCustomRotors = [offersRotor]
    }
    
    
    // setup the model
    
    func setUpStoreModel() {
        
        let store1 = Store(storeName: "PAI Electronics", storeAddress: "Jayanager 3rd block", hasSpecialOffers: false)
        let store2 = Store(storeName: "Sangeetha Electronics", storeAddress: "Jayanager 4rd block", hasSpecialOffers: false)
        let store3 = Store(storeName: "Vikas Electronics", storeAddress: "Rajajinager 1st cross", hasSpecialOffers: true)
        let store4 = Store(storeName: "Gireesh Electronics", storeAddress: "Rajajinager 7th cross", hasSpecialOffers: false)
        let store5 = Store(storeName: "Vivo Electronics", storeAddress: "Rajajinager 4th cross", hasSpecialOffers: true)
        let store6 = Store(storeName: "Ganesh Electronics", storeAddress: "Rajajinager 4th cross", hasSpecialOffers: false)
        let store7 = Store(storeName: "Veekay Electronics", storeAddress: "Rajajinager 4th cross", hasSpecialOffers: true)
        
        stores = [store1,store2,store3,store4,store5,store6,store7]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stores.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text =  stores[indexPath.row].storeName
        cell.detailTextLabel?.text =  stores[indexPath.row].storeAddress
        
        if stores[indexPath.row].hasSpecialOffers
        {
            let offerImageView = UIImageView.init(image: UIImage.init(named: "Special_Offer.png"))
            cell.accessoryView = offerImageView
            
        }
        
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
