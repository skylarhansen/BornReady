//
//  TaskViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/12/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TaskTableViewCellDelegate {
    
    fileprivate let kKitchen = "Kitchen"
    fileprivate let kLiving = "Living Room"
    fileprivate let kNursery = "Nursery & Bedroom"
    fileprivate let kGarage = "Garage"
    fileprivate let kBathroom = "Bathroom"
    fileprivate let kOutdoors = "Outdoors"
    fileprivate let kLaundry = "Laundry Room"
    fileprivate let kGeneral = "General"
    
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
    
    
    // MARK: - UIViewController Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpColors()
        
        taskListTableView.estimatedRowHeight = 100
        taskListTableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.title = room?.name.uppercased()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        setUpColors()
        
        taskListTableView.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as? TaskTableViewCell ?? TaskTableViewCell()
        let task = sections[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        let name = room?.name
        
        cell.updateWith(task)
        cell.delegate = self
        cell.accessoryView = UIImageView.init(image: UIImage(named: "chevron"))
        cell.taskLabel.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let sectionName = sections[section].first?.section.uppercased() {
            return sectionName
        } else {
            return nil
        }
    }
    
    
    // MARK: - UITableViewDelegate Functions
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let room = room else { return }
        
        let headerText: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        headerText.textLabel?.font = UIFont(name: "Aller-Regular", size: 18)
        headerText.textLabel?.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
        switch room.name {
            
        case kKitchen:
            view.tintColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
        case kLiving:
            view.tintColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
        case kNursery:
            view.tintColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
        case kGarage:
            view.tintColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
        case kBathroom:
            view.tintColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
        case kOutdoors:
            view.tintColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
        case kLaundry:
            view.tintColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
        case kGeneral:
            view.tintColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    
    
    // MARK: - TaskTableViewCellDelegate function
    
    func taskCellIsCompleteButtonTapped(_ sender: TaskTableViewCell) {
        
        guard let indexPath = taskListTableView.indexPath(for: sender) else { return }
        let task = sections[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        
        TaskController.sharedController.isCompleteValueToggled(task)
        
        taskListTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTaskInfo",
            let indexPath = taskListTableView.indexPathForSelectedRow {
            let infoVC = segue.destination as? InformationViewController
            let task = sections[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
            infoVC?.task = task
        }
    }
    
    
    // MARK: - Custom Functions
    
    func setUpColors() {
        
        guard let room = room else { return }
        
        switch room.name {
            
        case kKitchen:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
        case kLiving:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
        case kNursery:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
        case kGarage:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
        case kBathroom:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
        case kOutdoors:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
        case kLaundry:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
        case kGeneral:
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
            taskListTableView.separatorColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
            taskListTableView.backgroundColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
        default:
            break
        }
    }
}










