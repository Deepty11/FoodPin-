//
//  RestaurantDetailViewController.swift
//  TableUsingUITableViewController
//
//  Created by Brotecs on 31/12/20.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView : UIImageView!
    @IBOutlet var restaurantTitle : UILabel!
    @IBOutlet var restaurantLocation : UILabel!
    @IBOutlet var restaurantType : UILabel!
    
    var restaurantImage = ""
    var resName = ""
    var resLocation = ""
    var resType = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurantImage)
        restaurantTitle.text = resName
        restaurantLocation.text = resLocation
        restaurantType.text = resType
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
