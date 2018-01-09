//
//  PropertyTableViewCell.swift
//  SwiftProject
//
//  Created by Admin on 1/3/18.
//  Copyright © 2018 eman. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var propertyTitle: UILabel!
    @IBOutlet weak var propertyPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.propertyTitle.layer.cornerRadius = 5
        self.propertyTitle.layer.masksToBounds = true    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
