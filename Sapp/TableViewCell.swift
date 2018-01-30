//
//  TableViewCell.swift
//  Sapp
//
//  Created by Akekapon Suebprom on 30/1/2561 BE.
//  Copyright © 2561 kratostracking. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
