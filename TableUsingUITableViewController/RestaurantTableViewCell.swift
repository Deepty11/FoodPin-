//
//  RestaurantTableViewCell.swift
//  TableUsingUITableViewController
//
//  Created by Brotecs on 28/12/20.
//

import UIKit

class RestaurantTableViewCell:UITableViewCell {
    
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var locationLabel : UILabel!
    @IBOutlet var typeLabel : UILabel!
    @IBOutlet var thumbneilImageView : UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
