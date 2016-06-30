//
//  MenuViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var mashLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var savedStoriesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newGameButton.layer.borderWidth = 4.0
        newGameButton.layer.cornerRadius = 6.0
        newGameButton.layer.borderColor = UIColor.myBlueColor().CGColor
        newGameButton.tintColor = UIColor.myBlueColor()
        savedStoriesButton.layer.borderWidth = 4.0
        savedStoriesButton.layer.cornerRadius = 6.0
        savedStoriesButton.layer.borderColor = UIColor.myBlueColor().CGColor
        savedStoriesButton.tintColor = UIColor.myBlueColor()
        mashLabel.textColor = UIColor.whiteColor()
        view.backgroundColor = UIColor.myGrayColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toNewMash" {
            let questionsViewController = segue.destinationViewController as! QuestionsViewController
            let mash = Mash(home1: "Mansion", home2: "Apartment", home3: "Shack", home4: "House", person1: "", person2: "", person3: "", person4: "", vehicle1: "", vehicle2: "", vehicle3: "", vehicle4: "", place1: "", place2: "", place3: "", place4: "", numOfKids1: "", numOfKids2: "", numOfKids3: "", numOfKids4: "", pet1: "", pet2: "", pet3: "", pet4: "", career1: "", career2: "", career3: "", career4: "", theNumber: 3)
            questionsViewController.mash = mash
        }
    }

}
