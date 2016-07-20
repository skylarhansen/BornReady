//
//  InformationViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var task: Task?
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var tipsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLabelOutlets()
    }
    
    func setUpLabelOutlets() {
        sectionLabel.text = task?.section
        taskLabel.text = task?.text
    }
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let task = task,
            tips = task.tips else { return 0 }
        return tips.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tipCell", forIndexPath: indexPath)
        
        guard let task = task,
            tips = task.tips,
            let tip = tips[indexPath.row] as? Tip else { return UITableViewCell() }
        
        cell.textLabel?.text = tip.text
        return cell
    }
    
}
