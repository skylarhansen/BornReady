//
//  TaskTableViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/12/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var carrotImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Action buttons
    
    @IBAction func isCompleteButtonTapped(sender: AnyObject) {
    }
    
}

