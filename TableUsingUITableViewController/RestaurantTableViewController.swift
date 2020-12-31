//
//  RestaurantTableViewController.swift
//  TableUsingUITableViewController
//
//  Created by Brotecs on 28/12/20.
//

import UIKit

/// <#Description#>
class RestaurantTableViewController: UITableViewController {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats",
    "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina",
    "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats",
    "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina",
    "donostia", "royaloak", "caskpubkitchen"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong",
    "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "NewYork", "New York", "New York", "New York", "New York", "New York", "New York",
    "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee  & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var restaurantIsChecked = [Bool](repeating: false, count: 21)
     


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    //UITableViewController protocol
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //force downcasting to  the custom UITableViewCell class ( i.e. ResataurantTableViewCell)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! RestaurantTableViewCell

//        cell.textLabel?.text = restaurantNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbneilImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbneilImageView.layer.cornerRadius = 30.0
        cell.thumbneilImageView.clipsToBounds = true
        
        if restaurantIsChecked[indexPath.row]{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            restaurantIsChecked.remove(at: indexPath.row)
//            restaurantNames.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//        }
////        tableView.reloadData()
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //shareAction
      
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {
            (action, view, boolValue)-> Void in
            let defaultText = "Just Checking in " + self.restaurantNames[indexPath.row]
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        })
        
        //deleteAction
        let deleteAction = UIContextualAction(style: .normal, title: "Delete", handler: {
            (action, view, boolValue)-> Void in
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade )
        })
        
        //To set background color for the swipe option
        //UIColor component values should be within 0 to 1
        //RGB color values differ from 0 to 255
        // so to match with the UIColor, the RGB color values should be divided by 255
        // in order to match it in between the range 0 to 1
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        
       
        // attach background image to delete Option using UIImage
        deleteAction.image = UIImage(named: "trash")
        return UISwipeActionsConfiguration(actions: [shareAction, deleteAction])
    }
    
    
    
    //To select a row in tableView
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
       
        
        
        //closure for callActionHandler
        let callActionHandler = {(action: UIAlertAction) -> Void in
            let optionMenu = UIAlertController(title: "Error", message: "Sorry ! this service is not available in this moment", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            optionMenu.addAction(cancelAction)
            self.present(optionMenu, animated: true, completion: nil)
            
        }
        
        //call in action
        let callAction = UIAlertAction(title: "Call Restaurant", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        
        
        //check in action handler closure
        let checkInHandler = {
            (action : UIAlertAction!)-> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.restaurantIsChecked[indexPath.row] = true
        }
        //checkin action
        
        let isChecked = restaurantIsChecked[indexPath.row]
        if isChecked {
            let checkInAction = UIAlertAction(title: "Undo Check in", style: .default, handler:{
                (action : UIAlertAction!)-> Void in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .none
                self.restaurantIsChecked[indexPath.row] = false
            })
            optionMenu.addAction(checkInAction)
        }else{
            let checkInAction = UIAlertAction(title: "Checkin", style: .default, handler:checkInHandler)
            optionMenu.addAction(checkInAction)
        }
        
        
        present(optionMenu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
