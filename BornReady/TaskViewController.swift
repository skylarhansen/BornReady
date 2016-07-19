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
    
    var sections: [[Task]] {
        guard let tasks = room?.tasks else { return [] }
        var taskArray = [Task]()
        for task in tasks {
            if let task = task as? Task {
                taskArray.append(task)
            }
        }
        return TaskController.makeSections(taskArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.translucent = true
//        self.navigationController?.view.backgroundColor = UIColor.clearColor()
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
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sectionName = sections[section].first?.section {
            return sectionName
        } else {
            return nil
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func taskCellIsCompleteButtonTapped(sender: TaskTableViewCell) {
        guard let indexPath = taskListTableView.indexPathForCell(sender) else {
            return
        }
        let task = sections[indexPath.section][indexPath.row]
        TaskController.sharedController.isCompleteValueToggled(task)
        taskListTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
