//
//  InformationViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let kKitchen = "Kitchen"
    private let kLiving = "Living Room"
    private let kNursery = "Nursery & Bedroom"
    private let kGarage = "Garage"
    private let kBathroom = "Bathroom"
    private let kOutdoors = "Outdoors"
    private let kLaundry = "Laundry Room"
    private let kGeneral = "General"
    
    var task: Task?
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var tipsTableView: UITableView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var sectionView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackgroundColors()
        setUpLabelOutlets()
        setUpIsCompleteButtonImage()
        
        tipsTableView.estimatedRowHeight = 100
        tipsTableView.rowHeight = UITableViewAutomaticDimension
        
        shareButton.backgroundColor = UIColor.whiteColor()
        shoppingButton.backgroundColor = UIColor.whiteColor()
    }
    
    // functions to update outlets
    
    func setUpBackgroundColors() {
        guard let task = task,
            let room = task.room else { return }
        
        switch room.name {
        case kKitchen:
            view.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 255/255, green: 230/255, blue: 153/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 255/255, green: 216/255, blue: 93/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 255/255, green: 216/255, blue: 93/255, alpha: 1.0)
        case kLiving:
            view.backgroundColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 222/255, green: 179/255, blue: 162/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 200/255, green: 130/255, blue: 102/255, alpha: 1.0)
        case kNursery:
            view.backgroundColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 188/255, green: 217/255, blue: 218/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 104/255, green: 170/255, blue: 172/255, alpha: 1.0)
        case kGarage:
            view.backgroundColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 253/255, green: 169/255, blue: 123/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 239/255, green: 134/255, blue: 87/255, alpha: 1.0)
        case kBathroom:
            view.backgroundColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 230/255, green: 192/255, blue: 206/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 213/255, green: 147/255, blue: 171/255, alpha: 1.0)
        case kOutdoors:
            view.backgroundColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 147/255, green: 241/255, blue: 169/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 96/255, green: 210/255, blue: 123/255, alpha: 1.0)
        case kLaundry:
            view.backgroundColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 127/255, green: 213/255, blue: 215/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 59/255, green: 184/255, blue: 187/255, alpha: 1.0)
        case kGeneral:
            view.backgroundColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
            taskLabel.backgroundColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
            isCompleteButton.backgroundColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
            lineView.backgroundColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
            taskView.backgroundColor = UIColor(red: 255/255, green: 191/255, blue: 155/255, alpha: 1.0)
            sectionLabel.backgroundColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 255/255, green: 144/255, blue: 83/255, alpha: 1.0)
        default:
            break
        }
    }
    
    func setUpLabelOutlets() {
        sectionLabel.text = task?.section.uppercaseString
        sectionLabel.font = UIFont(name: "Aller-Regular", size: 18)
        sectionLabel.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
        taskLabel.text = task?.text
        taskLabel.font = UIFont(name: "Aller-Regular", size: 16)
        taskLabel.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
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
            shoppingButton.setImage(UIImage(named: "shoppingButtonInactive"), forState: .Normal)
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
        guard let cell = tableView.dequeueReusableCellWithIdentifier("tipCell", forIndexPath: indexPath) as? TipsTableViewCell else { return TipsTableViewCell() }
        
        guard let task = task,
            tips = task.tips,
            let tip = tips[indexPath.row] as? Tip else { return UITableViewCell() }
        
        cell.updateWith(tip)
        
        return cell
    }
}
