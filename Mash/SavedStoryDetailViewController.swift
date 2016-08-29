//
//  SavedStoryDetailViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 7/1/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class SavedStoryDetailViewController: UIViewController {

    @IBOutlet weak var mUIView: UIView!
    @IBOutlet weak var aUIView: UIView!
    @IBOutlet weak var sUIView: UIView!
    @IBOutlet weak var hUIView: UIView!
    @IBOutlet weak var person1UIView: UIView!
    @IBOutlet weak var person2UIView: UIView!
    @IBOutlet weak var person3UIView: UIView!
    @IBOutlet weak var person4UIView: UIView!
    @IBOutlet weak var place1UIView: UIView!
    @IBOutlet weak var place2UIView: UIView!
    @IBOutlet weak var place3UIView: UIView!
    @IBOutlet weak var place4UIView: UIView!
    @IBOutlet weak var vehicle1UIView: UIView!
    @IBOutlet weak var vehicle2UIView: UIView!
    @IBOutlet weak var vehicle3UIView: UIView!
    @IBOutlet weak var vehicle4UIView: UIView!
    @IBOutlet weak var career1UIView: UIView!
    @IBOutlet weak var career2UIView: UIView!
    @IBOutlet weak var career3UIView: UIView!
    @IBOutlet weak var career4UIView: UIView!
    @IBOutlet weak var numOfKids1UIView: UIView!
    @IBOutlet weak var numOfKids2UIView: UIView!
    @IBOutlet weak var numOfKids3UIView: UIView!
    @IBOutlet weak var numOfKids4UIView: UIView!
    @IBOutlet weak var pet1UIView: UIView!
    @IBOutlet weak var pet2UIView: UIView!
    @IBOutlet weak var pet3UIView: UIView!
    @IBOutlet weak var pet4UIView: UIView!
    
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var peopleTitleLabel: UILabel!
    @IBOutlet weak var person1Label: UILabel!
    @IBOutlet weak var person2Label: UILabel!
    @IBOutlet weak var person3Label: UILabel!
    @IBOutlet weak var person4Label: UILabel!
    @IBOutlet weak var placesTitleLabel: UILabel!
    @IBOutlet weak var place1Label: UILabel!
    @IBOutlet weak var place2Label: UILabel!
    @IBOutlet weak var place3Label: UILabel!
    @IBOutlet weak var place4Label: UILabel!
    @IBOutlet weak var vehiclesTitleLabel: UILabel!
    @IBOutlet weak var vehicle1Label: UILabel!
    @IBOutlet weak var vehicle2Label: UILabel!
    @IBOutlet weak var vehicle3Label: UILabel!
    @IBOutlet weak var vehicle4Label: UILabel!
    @IBOutlet weak var careersTitleLabel: UILabel!
    @IBOutlet weak var career1Label: UILabel!
    @IBOutlet weak var career2Label: UILabel!
    @IBOutlet weak var career3Label: UILabel!
    @IBOutlet weak var career4Label: UILabel!
    @IBOutlet weak var numOfKidsTitleLabel: UILabel!
    @IBOutlet weak var numOfKids1Label: UILabel!
    @IBOutlet weak var numOfKids2Label: UILabel!
    @IBOutlet weak var numOfKids3Label: UILabel!
    @IBOutlet weak var numOfKids4Label: UILabel!
    @IBOutlet weak var petsTitleLabel: UILabel!
    @IBOutlet weak var pet1Label: UILabel!
    @IBOutlet weak var pet2Label: UILabel!
    @IBOutlet weak var pet3Label: UILabel!
    @IBOutlet weak var pet4Label: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    
    var mash: Mash?
    var homesArray: [String] = ["Mansion", "Apartment", "Shack", "House"]
    var peopleArray: [String] = []
    var placesArray: [String] = []
    var vehiclesArray: [String] = []
    var careersArray: [String] = []
    var numOfKidsArray: [String] = []
    var petsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleTitleLabel.adjustsFontSizeToFitWidth = true
        peopleTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        placesTitleLabel.adjustsFontSizeToFitWidth = true
        placesTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        vehiclesTitleLabel.adjustsFontSizeToFitWidth = true
        vehiclesTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        careersTitleLabel.adjustsFontSizeToFitWidth = true
        careersTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        numOfKidsTitleLabel.adjustsFontSizeToFitWidth = true
        numOfKidsTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        petsTitleLabel.adjustsFontSizeToFitWidth = true
        petsTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        let story = StoryController.sharedController.getStory(Int((mash?.theNumber!)!))
        
        if let mash = self.mash {
            peopleArray = [mash.person1!, mash.person2!, mash.person3!, mash.person4!]
            placesArray = [mash.place1!, mash.place2!, mash.place3!, mash.place4!]
            vehiclesArray = [mash.vehicle1!, mash.vehicle2!, mash.vehicle3!, mash.vehicle4!]
            careersArray = [mash.career1!, mash.career2!, mash.career3!, mash.career4!]
            numOfKidsArray = [mash.numOfKids1!, mash.numOfKids2!, mash.numOfKids3!, mash.numOfKids4!]
            petsArray = [mash.pet1!, mash.pet2!, mash.pet3!, mash.pet4!]
            
            storyLabel.text = "You married \(peopleArray[story.results[1]]) and live happily in a \(homesArray[story.results[0]]) in \(placesArray[story.results[2]]). You drive a \(vehiclesArray[story.results[3]]) to work where you are a(n) \(careersArray[story.results[4]]), and come home each day to \(numOfKidsArray[story.results[5]]) kid(s) and a pet \(petsArray[story.results[6]])."
        }
        
        person1Label.text = mash?.person1
        person2Label.text = mash?.person2
        person3Label.text = mash?.person3
        person4Label.text = mash?.person4
        place1Label.text = mash?.place1
        place2Label.text = mash?.place2
        place3Label.text = mash?.place3
        place4Label.text = mash?.place4
        vehicle1Label.text = mash?.vehicle1
        vehicle2Label.text = mash?.vehicle2
        vehicle3Label.text = mash?.vehicle3
        vehicle4Label.text = mash?.vehicle4
        career1Label.text = mash?.career1
        career2Label.text = mash?.career2
        career3Label.text = mash?.career3
        career4Label.text = mash?.career4
        numOfKids1Label.text = mash?.numOfKids1
        numOfKids2Label.text = mash?.numOfKids2
        numOfKids3Label.text = mash?.numOfKids3
        numOfKids4Label.text = mash?.numOfKids4
        pet1Label.text = mash?.pet1
        pet2Label.text = mash?.pet2
        pet3Label.text = mash?.pet3
        pet4Label.text = mash?.pet4
        
        let homeUIViews = [mUIView, aUIView, sUIView, hUIView]
        let peopleUIViews = [person1UIView, person2UIView, person3UIView, person4UIView]
        let placeUIViews = [place1UIView, place2UIView, place3UIView, place4UIView]
        let vehicleUIViews = [vehicle1UIView, vehicle2UIView, vehicle3UIView, vehicle4UIView]
        let careerUIViews = [career1UIView, career2UIView, career3UIView, career4UIView]
        let numOfKidsUIViews = [numOfKids1UIView, numOfKids2UIView, numOfKids3UIView, numOfKids4UIView]
        let petUIViews = [pet1UIView, pet2UIView, pet3UIView, pet4UIView]
        let allUIViews = [homeUIViews, peopleUIViews, placeUIViews, vehicleUIViews, careerUIViews, numOfKidsUIViews, petUIViews]
        
        drawAnotherLine(allUIViews[story.theProcess[0]][story.theProcess[1]])
        drawAnotherLine(allUIViews[story.theProcess[2]][story.theProcess[3]])
        drawAnotherLine(allUIViews[story.theProcess[4]][story.theProcess[5]])
        drawAnotherLine(allUIViews[story.theProcess[6]][story.theProcess[7]])
        drawAnotherLine(allUIViews[story.theProcess[8]][story.theProcess[9]])
        drawAnotherLine(allUIViews[story.theProcess[10]][story.theProcess[11]])
        drawAnotherLine(allUIViews[story.theProcess[12]][story.theProcess[13]])
        drawAnotherLine(allUIViews[story.theProcess[14]][story.theProcess[15]])
        drawAnotherLine(allUIViews[story.theProcess[16]][story.theProcess[17]])
        drawAnotherLine(allUIViews[story.theProcess[18]][story.theProcess[19]])
        drawAnotherLine(allUIViews[story.theProcess[20]][story.theProcess[21]])
        drawAnotherLine(allUIViews[story.theProcess[22]][story.theProcess[23]])
        drawAnotherLine(allUIViews[story.theProcess[24]][story.theProcess[25]])
        drawAnotherLine(allUIViews[story.theProcess[26]][story.theProcess[27]])
        drawAnotherLine(allUIViews[story.theProcess[28]][story.theProcess[29]])
        drawAnotherLine(allUIViews[story.theProcess[30]][story.theProcess[31]])
        drawAnotherLine(allUIViews[story.theProcess[32]][story.theProcess[33]])
        drawAnotherLine(allUIViews[story.theProcess[34]][story.theProcess[35]])
        drawAnotherLine(allUIViews[story.theProcess[36]][story.theProcess[37]])
        drawAnotherLine(allUIViews[story.theProcess[38]][story.theProcess[39]])
        drawAnotherLine(allUIViews[story.theProcess[40]][story.theProcess[41]])
    }
    
    func drawAnotherLine(uiview: UIView) {
        // This is the actual dimensions of the line when we're done
        let path = UIBezierPath()
        var thePointMake = CGPointMake(10.0, 16.0)
        var secondPointMake = CGPointMake(100.0, 16.0)
        switch uiview {
        case self.mUIView, self.aUIView, self.sUIView, self.hUIView:
            thePointMake = CGPointMake(10.0, 30.0)
            secondPointMake = CGPointMake(50.0, 10.0)
            break
        default:
            thePointMake = CGPointMake(10.0, 16.0)
            secondPointMake = CGPointMake(100.0, 16.0)
            break
        }
        path.moveToPoint(thePointMake)
        path.addLineToPoint(secondPointMake)
        
        // This deals with the attributes of the line such as color, width, etc
        let pathLayer = CAShapeLayer()
        pathLayer.frame = uiview.bounds
        pathLayer.path = path.CGPath  // Connect this to the line we defined above
        pathLayer.strokeColor = UIColor.redColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.5
        pathLayer.lineJoin = kCALineJoinBevel
        uiview.layer.addSublayer(pathLayer)
    }

}
