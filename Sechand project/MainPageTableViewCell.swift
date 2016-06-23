//
//  MainPageTableViewCell.swift
//  Sechand project
//
//  Created by levi on 2016/6/15.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var catagoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
