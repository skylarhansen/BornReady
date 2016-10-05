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
    
    var delegate: TaskTableViewCellDelegate?
    
    func updateIsCompleteButton(_ isComplete: Bool) {
        
        if isComplete {
            isCompleteButton.setImage(UIImage(named: "complete"), for: UIControlState())
        } else {
            isCompleteButton.setImage(UIImage(named: "incomplete"), for: UIControlState())
        }
    }
    
    // MARK: - Action buttons
    
    @IBAction func isCompleteButtonTapped(_ sender: AnyObject) {
        
        delegate?.taskCellIsCompleteButtonTapped(self)
    }
    
}


protocol TaskTableViewCellDelegate {
    
    func taskCellIsCompleteButtonTapped(_ sender: TaskTableViewCell)
}


extension TaskTableViewCell {
    
    func updateWith(_ task: Task) {
        
        taskLabel.text = task.text
        taskLabel.font = UIFont(name: "Aller-Regular", size: 16)
        updateIsCompleteButton(task.isComplete.boolValue)
    }
}

