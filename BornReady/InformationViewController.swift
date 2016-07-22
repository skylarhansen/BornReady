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
        setUpIsCompleteButtonImage()
    }
    
    // functions to update outlets
    
    func setUpLabelOutlets() {
        sectionLabel.text = task?.section.uppercaseString
        sectionLabel.font = UIFont(name: "Aller-Regular", size: 18)
        taskLabel.text = task?.text
        taskLabel.font = UIFont(name: "Aller-Regular", size: 16)
        setUpShoppingButtonImage()
    }
    
    func setUpIsCompleteButtonImage() {
        
        if task?.isComplete.boolValue == true {
            isCompleteButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            isCompleteButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    func setUpShoppingButtonImage() {
        guard let taskLink = task?.link else { return }
        
        if taskLink == "" {
            shoppingButton.enabled = false
            shoppingButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    // MARK: - Action Button
    
    @IBAction func isCompleteButtonTapped(sender: AnyObject) {
        
        guard let task = task else { return }
        
        TaskController.sharedController.isCompleteValueToggled(task)
        setUpIsCompleteButtonImage()
        
    }
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        presentActivityViewController()
    }
    
    @IBAction func shoppingButtonTapped(sender: AnyObject) {
        guard let task = task else  { return }
        
        UIApplication.sharedApplication().openURL(NSURL(string: task.link) ?? NSURL())
    }
    
    // customize share button attributes
    
    func presentActivityViewController() {
        
        guard let task = task?.text else { return }
        
        let string = "Check out this baby-proofing tip: \"\(task)\""
        
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        
        presentViewController(activityViewController, animated: true, completion: nil)
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
        cell.textLabel?.font = UIFont(name: "Aller-Regular", size: 16)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
}
