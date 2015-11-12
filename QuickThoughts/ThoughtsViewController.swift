//
//  ThoughtsViewController.swift
//  QuickThoughts
//
//  Created by Robert Shepperd on 11/9/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

import UIKit



class ThoughtsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.addObserver(self, selector: "thoughtsUpdated:", name: thoughtsUpdateNotification, object: nil)
    
    }
    
    func thoughtsUpdated(notification: NSNotification) {
       
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath)
        
        let thought = ThoughtsController.sharedInstance.thoughts[indexPath.row]
        
        cell.textLabel?.text = thought.title
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ThoughtsController.sharedInstance.thoughts.count
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            let thought = ThoughtsController.sharedInstance.thoughts[indexPath.row]
            
            ThoughtsController.sharedInstance.removeThoughts(thought)
            
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            tableView.reloadData()
            
            
            
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showThought" {
            if let detailVC = segue.destinationViewController as? EnterThoughtsViewController {
                _ = detailVC.view
                
                let indexPath = tableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let thought = ThoughtsController.sharedInstance.thoughts[selectedRow]
                    detailVC.updateWithThought(thought)
                }
            }
        }
        
    }
}

