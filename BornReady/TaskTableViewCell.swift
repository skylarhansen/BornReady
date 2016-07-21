//
//  TaskTableViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/12/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var delegate: TaskTableViewCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateIsCompleteButton(isComplete: Bool) {
        if isComplete {
            isCompleteButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            isCompleteButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }

    // MARK: - Action buttons
    
    @IBAction func isCompleteButtonTapped(sender: AnyObject) {
        delegate?.taskCellIsCompleteButtonTapped(self)
    }
    
}

protocol TaskTableViewCellDelegate {
    func taskCellIsCompleteButtonTapped(sender: TaskTableViewCell)
}

extension TaskTableViewCell {
    func updateWith(task: Task) {
        taskLabel.text = task.text
        taskLabel.font = UIFont(name: "Aller-Regular", size: 16)
        updateIsCompleteButton(task.isComplete.boolValue)
    }
}

