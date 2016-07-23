//
//  TaskViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/12/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskTableViewCellDelegate {
    
    private let kKitchen = "Kitchen"
    private let kLiving = "Living Room"
    private let kNursery = "Nursery & Bedroom"
    private let kGarage = "Garage"
    private let kBathroom = "Bathroom"
    private let kOutdoors = "Outdoors"
    private let kLaundry = "Laundry Room"
    private let kGeneral = "General"
    
    
    @IBOutlet weak var taskListTableView: UITableView!
    
    var room: Room?
    
    // turns tasks from NSOrderedSet into an array and then calls makeSections func
    var sections: [[Task]] {
        guard let tasks = room?.tasks else { return [] }
        var taskArray: [Task] = []
        for task in tasks {
            if let task = task as? Task {
                taskArray.append(task)
            }
        }
        return TaskController.makeSections(taskArray)
    }
    
    // View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpColors()
        
        taskListTableView.estimatedRowHeight = 100
        taskListTableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.navigationItem.title = room?.name.uppercaseString
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        taskListTableView.reloadData()
    }
    
    // set up colors
    
    func setUpColors() {
        guard let room = room else { return }
        
        switch room.name {
        case kKitchen:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 216/255, blue: 93/255, alpha: 1.0)
        case kLiving:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
        case kNursery:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
        case kGarage:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
        case kBathroom:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
        case kOutdoors:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
        case kLaundry:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
        case kGeneral:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
        default:
            break
        }
    }

    // MARK: - UITableViewDataSource Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell") as? TaskTableViewCell ?? TaskTableViewCell()
        let task = sections[indexPath.section][indexPath.row]
        let name = room?.name
        
        cell.updateWith(task)
        cell.delegate = self
        
        if name == kKitchen {
            cell.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
        } else if name == kLiving {
            cell.backgroundColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
        } else if name == kNursery {
            cell.backgroundColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
        } else if name == kGarage {
            cell.backgroundColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
        } else if name == kBathroom {
            cell.backgroundColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
        } else if name == kOutdoors {
            cell.backgroundColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
        } else if name == kLaundry {
            cell.backgroundColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
        } else if name == kGeneral {
            cell.backgroundColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        taskListTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    // customize sections
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sectionName = sections[section].first?.section.uppercaseString {
            return sectionName
        } else {
            return nil
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    // TaskTableViewCellDelegate function
    
    func taskCellIsCompleteButtonTapped(sender: TaskTableViewCell) {
        guard let indexPath = taskListTableView.indexPathForCell(sender) else {
            return
        }
        let task = sections[indexPath.section][indexPath.row]
        TaskController.sharedController.isCompleteValueToggled(task)
        taskListTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTaskInfo",
            let indexPath = taskListTableView.indexPathForSelectedRow {
            let infoVC = segue.destinationViewController as? InformationViewController
            let task = sections[indexPath.section][indexPath.row]
            infoVC?.task = task
        }
    }
}










