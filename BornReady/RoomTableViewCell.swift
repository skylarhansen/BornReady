//
//  RoomTableViewCell.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    fileprivate let kKitchen = "Kitchen"
    fileprivate let kLiving = "Living Room"
    fileprivate let kNursery = "Nursery & Bedroom"
    fileprivate let kGarage = "Garage"
    fileprivate let kBathroom = "Bathroom"
    fileprivate let kOutdoors = "Outdoors"
    fileprivate let kLaundry = "Laundry Room"
    fileprivate let kGeneral = "General"
    
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var room: Room?
    
    func changeSizeOfProgressBar() {
        
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 3)
    }
    
    func setProgressOfCompletedTasks(_ room: Room) {
        
        guard let tasks = room.tasks else { return }
        let completedTasksFloatValue = Float(TaskController.sharedController.completedTasks(room).count)
        let totalTasksFloatValue = Float(tasks.count)
        let fractionalProgress = completedTasksFloatValue / totalTasksFloatValue
        
        progressBar.setProgress(fractionalProgress, animated: false)
    }
    
    func changeColorOfProgressBar(_ room: Room) {
        
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
    
    func updateWith(_ room: Room) {
        
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
