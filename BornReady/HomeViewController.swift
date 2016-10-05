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
        
        let firstRun = UserDefaults.standard.bool(forKey: "firstRun") as Bool
        if !firstRun {
            TaskController.sharedController.serializeJSON({ (rooms) in
                TaskController.sharedController.saveContext()
            })
            UserDefaults.standard.set(true, forKey: "firstRun")
        }
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0), NSFontAttributeName: UIFont(name: "Aller-Regular", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        roomListTableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskController.sharedController.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell") as? RoomTableViewCell ?? RoomTableViewCell()
        let room = TaskController.sharedController.rooms[(indexPath as NSIndexPath).row]
        
        cell.updateWith(room)
        cell.changeSizeOfProgressBar()
        cell.roomLabel.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        cell.progressLabel.textColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1.0)
        
        return cell
        
    }
    
    
    // MARK: - UITableViewDelegate Functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTaskList",
            let indexPath = roomListTableView.indexPathForSelectedRow {
            let taskVC = segue.destination as? TaskViewController
            let room = TaskController.sharedController.rooms[(indexPath as NSIndexPath).row]
            taskVC?.room = room
        }
    }
}


