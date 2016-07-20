//
//  RoomTableViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWith(room: Room) {
        roomImageView.image = UIImage(named: room.imageString)
        roomLabel.text = room.name
        roomLabel.font = UIFont(name: "Aller-Regular", size: 24)
    }

}
