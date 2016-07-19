//
//  HomeViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var roomListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedController.serializeJSON { (success) in
            
        }
        
//        var sectionsArray: [String] = []
        
//        guard let tasks = TaskController.sharedController.rooms[0].tasks,
//            let task = tasks[0] as? Task,
//            let tips = task.tips,
//            let _ = tips[0] as? Tip else { return }
//    
//        
//        for task in tasks {
//            guard let task = task as? Task else { return }
//            if sectionsArray.contains(task.section) {
//                
//            } else {
//                sectionsArray.append(task.section)
//            }
//        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        
        let button: UIButton = UIButton.init(type: .Custom)        //set image for button
        button.setImage(UIImage(named: "complete"), forState: UIControlState.Normal)
        button.frame = CGRectMake(0, 0, 24, 24)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedController.rooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("roomCell") as? RoomTableViewCell {
            let room = TaskController.sharedController.rooms[indexPath.row]
            cell.updateWith(room)
            return cell
        } else {
            return RoomTableViewCell()
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toTaskList",
            let indexPath = roomListTableView.indexPathForSelectedRow {
            let taskVC = segue.destinationViewController as? TaskViewController
            let room = TaskController.sharedController.rooms[indexPath.row]
            taskVC?.room = room
        }
    }
}


