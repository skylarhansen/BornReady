//
//  InformationViewController.swift
//  BornReady
//
//  Created by Skylar Hansen on 7/13/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate let kKitchen = "Kitchen"
    fileprivate let kLiving = "Living Room"
    fileprivate let kNursery = "Nursery & Bedroom"
    fileprivate let kGarage = "Garage"
    fileprivate let kBathroom = "Bathroom"
    fileprivate let kOutdoors = "Outdoors"
    fileprivate let kLaundry = "Laundry Room"
    fileprivate let kGeneral = "General"
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var tipsTableView: UITableView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var sectionView: UIView!
    
    var task: Task?
    
    
    // MARK: - UIViewController Lifecyle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpBackgroundColors()
        setUpLabelOutlets()
        setUpIsCompleteButtonImage()
        
        tipsTableView.estimatedRowHeight = 100
        tipsTableView.rowHeight = UITableViewAutomaticDimension
        
        shareButton.backgroundColor = UIColor.white
        shoppingButton.backgroundColor = UIColor.white
    }
    
    
    // MARK: - UITableViewDataSource Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let task = task,
            let tips = task.tips else { return 0 }
        
        return tips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath) as? TipsTableViewCell ?? TipsTableViewCell()
        
        guard let task = task,
            let tips = task.tips,
            let tip = tips[(indexPath as NSIndexPath).row] as? Tip else { return UITableViewCell() }
        
        cell.updateWith(tip)
        
        return cell
    }
    
    
    // MARK: - Custom Functions
    
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
            sectionLabel.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
            sectionView.backgroundColor = UIColor(red: 255/255, green: 221/255, blue: 93/255, alpha: 1.0)
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
        
        sectionLabel.text = task?.section.uppercased()
        sectionLabel.font = UIFont(name: "Aller-Regular", size: 18)
        sectionLabel.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
        taskLabel.text = task?.text
        taskLabel.font = UIFont(name: "Aller-Regular", size: 16)
        taskLabel.textColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1.0)
        
        setUpShoppingButtonImage()
    }
    
    func setUpIsCompleteButtonImage() {
        
        if task?.isComplete.boolValue == true {
            isCompleteButton.setImage(UIImage(named: "complete"), for: UIControlState())
        } else {
            isCompleteButton.setImage(UIImage(named: "incomplete"), for: UIControlState())
        }
    }
    
    func setUpShoppingButtonImage() {
        
        guard let taskLink = task?.link else { return }
        
        if taskLink == "" {
            shoppingButton.isEnabled = false
            shoppingButton.setImage(UIImage(named: "shoppingButtonInactive"), for: UIControlState())
        }
    }
    
    func presentActivityViewController() {
        
        guard let task = task?.text else { return }
        
        let string = "Check out this baby-proofing tip:\n\"\(task)\""
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Action Button
    
    @IBAction func isCompleteButtonTapped(_ sender: AnyObject) {
        
        guard let task = task else { return }
        
        TaskController.sharedController.isCompleteValueToggled(task)
        
        setUpIsCompleteButtonImage()
        
    }
    
    @IBAction func shareButtonTapped(_ sender: AnyObject) {
        
        presentActivityViewController()
    }
    
    @IBAction func shoppingButtonTapped(_ sender: AnyObject) {
        
        guard let task = task else  { return }
        
        UIApplication.shared.openURL(URL(string: task.link) ?? URL())
    }
}
