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
        progressBar.transform = CGAffineTransformMakeScale(1, 8)
    }
    
    func changeColorOfProgressBar(room: Room) {
        switch room.name {
        case kKitchen:
            progressBar.progressTintColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
        case kLiving:
            progressBar.progressTintColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
        case kNursery:
            progressBar.progressTintColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
        case kGarage:
            progressBar.progressTintColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
        case kBathroom:
            progressBar.progressTintColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
        case kOutdoors:
            progressBar.progressTintColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
        case kLaundry:
            progressBar.progressTintColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
        case kGeneral:
            progressBar.progressTintColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
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
    }
}
