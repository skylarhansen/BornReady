//
//  TipsTableViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/25/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class TipsTableViewCell: UITableViewCell {

    @IBOutlet weak var tipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateLabel(tip: Tip) {
        tipLabel.text = tip.text
        tipLabel.font = UIFont(name: "Aller-Regular", size: 16)
        tipLabel.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
    }

}
