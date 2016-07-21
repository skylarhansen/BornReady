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
        
        let firstRun = NSUserDefaults.standardUserDefaults().boolForKey("firstRun") as Bool
        if !firstRun {
            TaskController.sharedController.serializeJSON({ (rooms) in
            
            })
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstRun")
        }
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
    
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = false
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0), NSFontAttributeName: UIFont(name: "Aller-Regular", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        roomListTableView.deselectRowAtIndexPath(indexPath, animated: true)
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


