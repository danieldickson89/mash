//
//  SavedStoriesTableViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class SavedStoriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundColor = UIColor.myGreenColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        //self.navigationController?.navigationBar.barTintColor = UIColor.myGrayColor()
        //UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MashController.sharedController.allMash.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mashStory", forIndexPath: indexPath)
        
        let mash = MashController.sharedController.allMash[indexPath.row]
        if let randomNum = mash.theNumber {
            let results = StoryController.sharedController.getStory(Int(randomNum)).results
            let story = StoryController.sharedController.storyResults(mash, storyResults: results)
            cell.textLabel?.text = "\(story[1])  |  \(story[2])  |  \(story[4])"
            cell.detailTextLabel?.text = "\(story[3])  |  \(story[5]) kid(s)  |  Pet \(story[6])"
            cell.imageView?.image = UIImage(named: "\(story[0])")
            cell.imageView?.contentMode = .ScaleAspectFit
            //cell.textLabel?.textColor = UIColor.whiteColor()
            //cell.detailTextLabel?.textColor = UIColor.whiteColor()
            //cell.backgroundColor = UIColor.myGreenColor()

        }
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let mash = MashController.sharedController.allMash[indexPath.row]
            MashController.sharedController.removeMash(mash)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toStoryDetail" {
            if let cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
                let savedStoryDetailController = segue.destinationViewController as! SavedStoryDetailViewController
                let mash = MashController.sharedController.allMash[indexPath.row]
                savedStoryDetailController.mash = mash
            }
        }
     }

}
