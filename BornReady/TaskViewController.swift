//
//  TaskViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/12/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskTableViewCellDelegate {
    
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
        case "Kitchen":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 216/255, blue: 93/255, alpha: 1.0)
        case "Living Room":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
        case "Nursery & Bedroom":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
        case "Garage":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
        case "Bathroom":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
        case "Outdoors":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
        case "Laundry Room":
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
        case "General":
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
        cell.updateWith(task)
        cell.delegate = self
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










