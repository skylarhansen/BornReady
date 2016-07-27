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
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func changeSizeOfProgressBar() {
        progressBar.transform = CGAffineTransformMakeScale(1, 3)
    }
    
    func setProgressOfCompletedTasks(room: Room) {
        
        guard let tasks = room.tasks else { return }
        let completedTasksFloatValue = Float(TaskController.sharedController.completedTasks(room).count)
        let totalTasksFloatValue = Float(tasks.count)
        let fractionalProgress = completedTasksFloatValue / totalTasksFloatValue
        
        progressBar.setProgress(fractionalProgress, animated: false)
    }
    
    func changeColorOfProgressBar(room: Room) {
        
        switch room.name {
        case kKitchen:
            progressBar.progressTintColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
        case kLiving:
            progressBar.progressTintColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
        case kNursery:
            progressBar.progressTintColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
        case kGarage:
            progressBar.progressTintColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
        case kBathroom:
            progressBar.progressTintColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
        case kOutdoors:
            progressBar.progressTintColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
        case kLaundry:
            progressBar.progressTintColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
        case kGeneral:
            progressBar.progressTintColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
        default:
            break
        }
    }
    
    func updateWith(room: Room) {
        
        roomImageView.image = UIImage(named: room.imageString)
        roomLabel.text = room.name
        roomLabel.font = UIFont(name: "Aller-Regular", size: 18)
        
        let tasksCompleted = TaskController.sharedController.completedTasks(room)
        guard let tasks = room.tasks else { return }
        
        progressLabel.text = "\(tasksCompleted.count)/\(tasks.count)"
        progressLabel.font = UIFont(name: "Aller-Regular", size: 14)
        changeColorOfProgressBar(room)
        setProgressOfCompletedTasks(room)
    }
}
