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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedController.serializeJSON { (success) in
            
        }
        
//        guard let rooms = TaskController.sharedController.rooms,
//            let tasks = rooms[0].tasks,
//            let task = tasks[0] as? Task,
//            let tips = task.tips,
//            let _ = tips[0] as? Tip else { return }
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        
        let button: UIButton = UIButton.init(type: .Custom)        //set image for button
        button.setImage(UIImage(named: "complete"), forState: UIControlState.Normal)
        button.frame = CGRectMake(0, 0, 24, 24)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let rooms = TaskController.sharedController.rooms else { return 0 }
        
        return rooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("roomCell") as? RoomTableViewCell,
            let rooms = TaskController.sharedController.rooms {
            let room = rooms[indexPath.row]
            cell.updateWith(room)
            return cell
        } else {
            return RoomTableViewCell()
        }
        
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


