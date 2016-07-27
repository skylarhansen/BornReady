//
//  RoomTableViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    private let kKitchen = "Kitchen"
    private let kLiving = "Living Room"
    private let kNursery = "Nursery & Bedroom"
    private let kGarage = "Garage"
    private let kBathroom = "Bathroom"
    private let kOutdoors = "Outdoors"
    private let kLaundry = "Laundry Room"
    private let kGeneral = "General"
    
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var room: Room?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func changeSizeOfProgressBar() {
        progressBar.transform = CGAffineTransformMakeScale(1, 3)
    }
    
    func setProgress(room: Room) {
        guard let tasks = room.tasks else { return }
        let completedTasksFloatValue = Float(TaskController.sharedController.completedTasks(room).count)
        let totalTasksFloatValue = Float(tasks.count)
        let fractionalProgress = completedTasksFloatValue / totalTasksFloatValue
        
        progressBar.setProgress(fractionalProgress, animated: false)
    }
    
    func changeColorOfProgressBar(room: Room) {
        switch room.name {
        case kKitchen:
            progressBar.progressTintColor = UIColor(red: 1.000, green: 0.847, blue: 0.400, alpha: 1.00)
        case kLiving:
            progressBar.progressTintColor = UIColor(red: 0.757, green: 0.463, blue: 0.357, alpha: 1.00)
        case kNursery:
            progressBar.progressTintColor = UIColor(red: 0.365, green: 0.627, blue: 0.635, alpha: 1.00)
        case kGarage:
            progressBar.progressTintColor = UIColor(red: 0.929, green: 0.478, blue: 0.302, alpha: 1.00)
        case kBathroom:
            progressBar.progressTintColor = UIColor(red: 0.812, green: 0.533, blue: 0.631, alpha: 1.00)
        case kOutdoors:
            progressBar.progressTintColor = UIColor(red: 0.337, green: 0.800, blue: 0.439, alpha: 1.00)
        case kLaundry:
            progressBar.progressTintColor = UIColor(red: 0.204, green: 0.686, blue: 0.702, alpha: 1.00)
        case kGeneral:
            progressBar.progressTintColor = UIColor(red: 1.000, green: 0.522, blue: 0.286, alpha: 1.00)
        default:
            break
        }
    }
    
    func updateWith(room: Room) {
        roomImageView.image = UIImage(named: room.imageString)
        roomLabel.text = room.name
        roomLabel.font = UIFont(name: "Aller-Regular", size: 24)
        var tasksCompleted: [Task]
        tasksCompleted = TaskController.sharedController.completedTasks(room)
        guard let tasks = room.tasks else { return }
        progressLabel.text = "\(tasksCompleted.count)/\(tasks.count)"
        progressLabel.font = UIFont(name: "Aller-Regular", size: 16)
        changeColorOfProgressBar(room)
        setProgress(room)
    }
}
