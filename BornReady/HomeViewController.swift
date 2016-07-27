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
    
    
    // MARK: - UIViewController Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let firstRun = NSUserDefaults.standardUserDefaults().boolForKey("firstRun") as Bool
        if !firstRun {
            TaskController.sharedController.serializeJSON({ (rooms) in
                TaskController.sharedController.saveContext()
            })
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstRun")
        }
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0), NSFontAttributeName: UIFont(name: "Aller-Regular", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        roomListTableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedController.rooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("roomCell") as? RoomTableViewCell ?? RoomTableViewCell()
        let room = TaskController.sharedController.rooms[indexPath.row]
        
        cell.updateWith(room)
        cell.changeSizeOfProgressBar()
        cell.roomLabel.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        cell.progressLabel.textColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1.0)
        
        return cell
        
    }
    
    
    // MARK: - UITableViewDelegate Functions
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80
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


