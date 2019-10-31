//
//  MainEventTableViewCell.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/10/30.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit

class MainEventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
