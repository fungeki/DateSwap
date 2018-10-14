//
//  ProductsNotificationTableViewCell.swift
//  DateSwap
//
//  Created by Ran Loock on 08/10/2018.
//  Copyright © 2018 Trisk Quality. All rights reserved.
//

import UIKit

class ProductsNotificationTableViewCell: UITableViewCell {

    
    var offers = [Like]()
    @IBOutlet weak var myItemUIImageView: UIImageView!
    
    @IBOutlet weak var productTitleUILabel: UILabel!
    
    @IBOutlet weak var chatsNotificationLabel: EditableLableUILabel!
    
    @IBOutlet weak var offersNotifiactionLabel: EditableLableUILabel!
    @IBOutlet weak var matchesNotificationsLabel: EditableLableUILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
