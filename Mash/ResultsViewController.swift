//
//  ResultsViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var person1Label: UILabel!
    @IBOutlet weak var person2Label: UILabel!
    @IBOutlet weak var person3Label: UILabel!
    @IBOutlet weak var person4Label: UILabel!
    @IBOutlet weak var place1Label: UILabel!
    @IBOutlet weak var place2Label: UILabel!
    @IBOutlet weak var place3Label: UILabel!
    @IBOutlet weak var place4Label: UILabel!
    @IBOutlet weak var vehicle1Label: UILabel!
    @IBOutlet weak var vehicle2Label: UILabel!
    @IBOutlet weak var vehicle3Label: UILabel!
    @IBOutlet weak var vehicle4Label: UILabel!
    @IBOutlet weak var career1Label: UILabel!
    @IBOutlet weak var career2Label: UILabel!
    @IBOutlet weak var career3Label: UILabel!
    @IBOutlet weak var career4Label: UILabel!
    @IBOutlet weak var numOfKids1Label: UILabel!
    @IBOutlet weak var numOfKids2Label: UILabel!
    @IBOutlet weak var numOfKids3Label: UILabel!
    @IBOutlet weak var numOfKids4Label: UILabel!
    @IBOutlet weak var pet1Label: UILabel!
    @IBOutlet weak var pet2Label: UILabel!
    @IBOutlet weak var pet3Label: UILabel!
    @IBOutlet weak var pet4Label: UILabel!
    
    
    @IBOutlet weak var mUIView: UIView!
    @IBOutlet weak var aUIView: UIView!
    @IBOutlet weak var sUIView: UIView!
    @IBOutlet weak var hUIView: UIView!
    @IBOutlet weak var peopleTitleLabel: UILabel!
    @IBOutlet weak var peopleUnderlineLabel: UILabel!
    @IBOutlet weak var person1UIView: UIView!
    @IBOutlet weak var person2UIView: UIView!
    @IBOutlet weak var person3UIView: UIView!
    @IBOutlet weak var person4UIView: UIView!
    @IBOutlet weak var placesTitleLabel: UILabel!
    @IBOutlet weak var placesUnderlineLabel: UILabel!
    @IBOutlet weak var place1UIView: UIView!
    @IBOutlet weak var place2UIView: UIView!
    @IBOutlet weak var place3UIView: UIView!
    @IBOutlet weak var place4UIView: UIView!
    @IBOutlet weak var vehicleTitleLabel: UILabel!
    @IBOutlet weak var vehicleUnderlineLabel: UILabel!
    @IBOutlet weak var vehicle1UIView: UIView!
    @IBOutlet weak var vehicle2UIView: UIView!
    @IBOutlet weak var vehicle3UIView: UIView!
    @IBOutlet weak var vehicle4UIView: UIView!
    @IBOutlet weak var careerTitleLabel: UILabel!
    @IBOutlet weak var careerUnderlineLabel: UILabel!
    @IBOutlet weak var career1UIView: UIView!
    @IBOutlet weak var career2UIView: UIView!
    @IBOutlet weak var career3UIView: UIView!
    @IBOutlet weak var career4UIView: UIView!
    @IBOutlet weak var numOfKidsTitleLabel: UILabel!
    @IBOutlet weak var numOfKidsUnderlineLabel: UILabel!
    @IBOutlet weak var numOfKids1UIView: UIView!
    @IBOutlet weak var numOfKids2UIView: UIView!
    @IBOutlet weak var numOfKidsUIView: UIView!
    @IBOutlet weak var numOfKids4UIView: UIView!
    @IBOutlet weak var petsUnderlineLabel: UILabel!
    @IBOutlet weak var petsTitleLabel: UILabel!
    @IBOutlet weak var pet1UIView: UIView!
    @IBOutlet weak var pet2UIView: UIView!
    @IBOutlet weak var pet3UIView: UIView!
    @IBOutlet weak var pet4UIView: UIView!
    
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tapWhenReadyButton: UIButton!
    @IBOutlet weak var spiralImageView: UIImageView!
    
    var mash: Mash?
    var homesArray: [String] = ["Mansion", "Apartment", "Shack", "House"]
    var peopleArray: [String] = []
    var placesArray: [String] = []
    var vehiclesArray: [String] = []
    var careersArray: [String] = []
    var numOfKidsArray: [String] = []
    var petsArray: [String] = []
    var randomNum = StoryController.sharedController.numberGenerator()
    var resultsShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleTitleLabel.adjustsFontSizeToFitWidth = true
        peopleTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        placesTitleLabel.adjustsFontSizeToFitWidth = true
        placesTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        vehicleTitleLabel.adjustsFontSizeToFitWidth = true
        vehicleTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        careerTitleLabel.adjustsFontSizeToFitWidth = true
        careerTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        numOfKidsTitleLabel.adjustsFontSizeToFitWidth = true
        numOfKidsTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        petsTitleLabel.adjustsFontSizeToFitWidth = true
        petsTitleLabel.lineBreakMode = NSLineBreakMode.ByClipping
        
        if let mash = self.mash {
            peopleArray = [mash.person1!, mash.person2!, mash.person3!, mash.person4!]
            placesArray = [mash.place1!, mash.place2!, mash.place3!, mash.place4!]
            vehiclesArray = [mash.vehicle1!, mash.vehicle2!, mash.vehicle3!, mash.vehicle4!]
            careersArray = [mash.career1!, mash.career2!, mash.career3!, mash.career4!]
            numOfKidsArray = [mash.numOfKids1!, mash.numOfKids2!, mash.numOfKids3!, mash.numOfKids4!]
            petsArray = [mash.pet1!, mash.pet2!, mash.pet3!, mash.pet4!]
        }
        
        mash?.theNumber = randomNum
        MashController.sharedController.saveToPersistence()
        
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
        
        //spiralImageView.hidden = true
        doneButton.hidden = true
        doneButton.enabled = false
        tapWhenReadyButton.titleLabel?.textAlignment = NSTextAlignment.Center
    }
    
    func animateSpiral() {
        spiralImageView.image = UIImage(named: "\(randomNum)SpiralE")
        var spiralAnimationImages: [UIImage] = []
        var spiralsCount = 0
        var i = 3
        repeat {
            if let spiralImage = UIImage(named: "\(i)Spiral") {
                spiralAnimationImages.append(spiralImage)
            }
            spiralsCount += 1
            i += 1
        } while (i <= randomNum)
        
        spiralImageView.animationImages = spiralAnimationImages
        spiralImageView.animationDuration = NSTimeInterval(randomNum / 8)
        spiralImageView.animationRepeatCount = 1
        spiralImageView.startAnimating()
    }
    
    func replaceSpiralWithStory() {
        
    }
    
    @IBAction func tapWhenReadyButtonTapped(sender: AnyObject) {
        let story = StoryController.sharedController.getStory(randomNum)
        let homeUIViews = [mUIView, aUIView, sUIView, hUIView]
        let peopleUIViews = [person1UIView, person2UIView, person3UIView, person4UIView]
        let placeUIViews = [place1UIView, place2UIView, place3UIView, place4UIView]
        let vehicleUIViews = [vehicle1UIView, vehicle2UIView, vehicle3UIView, vehicle4UIView]
        let careerUIViews = [career1UIView, career2UIView, career3UIView, career4UIView]
        let numOfKidsUIViews = [numOfKids1UIView, numOfKids2UIView, numOfKidsUIView, numOfKids4UIView]
        let petUIViews = [pet1UIView, pet2UIView, pet3UIView, pet4UIView]
        let allUIViews = [homeUIViews, peopleUIViews, placeUIViews, vehicleUIViews, careerUIViews, numOfKidsUIViews, petUIViews]
        if !resultsShown {
            tapWhenReadyButton.setTitle("", forState: .Normal)
            doneButton.enabled = true
            doneButton.hidden = false
            drawAnotherLine(allUIViews[story.theProcess[0]][story.theProcess[1]], lineNum: 1)
            resultsShown = true
            animateSpiral()
        } else {
            animateSpiral()
        }
    }

}

extension ResultsViewController {
    
    func drawAnotherLine(uiview: UIView, lineNum: Int) {
        // This is the actual dimensions of the line when we're done
        let path = UIBezierPath()
        var thePointMake = CGPointMake(10.0, 16.0)
        var secondPointMake = CGPointMake(100.0, 16.0)
        switch uiview {
        case self.mUIView, self.aUIView, self.sUIView, self.hUIView:
            thePointMake = CGPointMake(20.0, 30.0)
            secondPointMake = CGPointMake(65.0, 0.0)
            break
        default:
            let y = (uiview.frame.height) / 2.0
            thePointMake = CGPointMake(10.0, y)
            secondPointMake = CGPointMake(100.0, y)
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
        
        // This allows us to watch the line being drawn
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.setValue("anim\(lineNum)", forKey: "id")
        pathAnimation.delegate = self
        pathAnimation.duration = 2.0
        pathAnimation.fromValue = Int(0.0)
        pathAnimation.toValue = Int(1.0)
        pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        let story = StoryController.sharedController.getStory(randomNum)
        let homeUIViews = [mUIView, aUIView, sUIView, hUIView]
        let peopleUIViews = [person1UIView, person2UIView, person3UIView, person4UIView]
        let placeUIViews = [place1UIView, place2UIView, place3UIView, place4UIView]
        let vehicleUIViews = [vehicle1UIView, vehicle2UIView, vehicle3UIView, vehicle4UIView]
        let careerUIViews = [career1UIView, career2UIView, career3UIView, career4UIView]
        let numOfKidsUIViews = [numOfKids1UIView, numOfKids2UIView, numOfKidsUIView, numOfKids4UIView]
        let petUIViews = [pet1UIView, pet2UIView, pet3UIView, pet4UIView]
        let allUIViews = [homeUIViews, peopleUIViews, placeUIViews, vehicleUIViews, careerUIViews, numOfKidsUIViews, petUIViews]
        
        if anim.valueForKey("id")!.isEqual("anim1") {
            drawAnotherLine(allUIViews[story.theProcess[2]][story.theProcess[3]], lineNum: 2)
        } else if anim.valueForKey("id")!.isEqual("anim2") {
            drawAnotherLine(allUIViews[story.theProcess[4]][story.theProcess[5]], lineNum: 3)
        } else if anim.valueForKey("id")!.isEqual("anim3") {
            drawAnotherLine(allUIViews[story.theProcess[6]][story.theProcess[7]], lineNum: 4)
        } else if anim.valueForKey("id")!.isEqual("anim4") {
            drawAnotherLine(allUIViews[story.theProcess[8]][story.theProcess[9]], lineNum: 5)
        } else if anim.valueForKey("id")!.isEqual("anim5") {
            drawAnotherLine(allUIViews[story.theProcess[10]][story.theProcess[11]], lineNum: 6)
        } else if anim.valueForKey("id")!.isEqual("anim6") {
            drawAnotherLine(allUIViews[story.theProcess[12]][story.theProcess[13]], lineNum: 7)
        } else if anim.valueForKey("id")!.isEqual("anim7") {
            drawAnotherLine(allUIViews[story.theProcess[14]][story.theProcess[15]], lineNum: 8)
        } else if anim.valueForKey("id")!.isEqual("anim8") {
            drawAnotherLine(allUIViews[story.theProcess[16]][story.theProcess[17]], lineNum: 9)
        } else if anim.valueForKey("id")!.isEqual("anim9") {
            drawAnotherLine(allUIViews[story.theProcess[18]][story.theProcess[19]], lineNum: 10)
        } else if anim.valueForKey("id")!.isEqual("anim10") {
            drawAnotherLine(allUIViews[story.theProcess[20]][story.theProcess[21]], lineNum: 11)
        } else if anim.valueForKey("id")!.isEqual("anim11") {
            drawAnotherLine(allUIViews[story.theProcess[22]][story.theProcess[23]], lineNum: 12)
        } else if anim.valueForKey("id")!.isEqual("anim12") {
            drawAnotherLine(allUIViews[story.theProcess[24]][story.theProcess[25]], lineNum: 13)
        } else if anim.valueForKey("id")!.isEqual("anim13") {
            drawAnotherLine(allUIViews[story.theProcess[26]][story.theProcess[27]], lineNum: 14)
        } else if anim.valueForKey("id")!.isEqual("anim14") {
            drawAnotherLine(allUIViews[story.theProcess[28]][story.theProcess[29]], lineNum: 15)
        } else if anim.valueForKey("id")!.isEqual("anim15") {
            drawAnotherLine(allUIViews[story.theProcess[30]][story.theProcess[31]], lineNum: 16)
        } else if anim.valueForKey("id")!.isEqual("anim16") {
            drawAnotherLine(allUIViews[story.theProcess[32]][story.theProcess[33]], lineNum: 17)
        } else if anim.valueForKey("id")!.isEqual("anim17") {
            drawAnotherLine(allUIViews[story.theProcess[34]][story.theProcess[35]], lineNum: 18)
        } else if anim.valueForKey("id")!.isEqual("anim18") {
            drawAnotherLine(allUIViews[story.theProcess[36]][story.theProcess[37]], lineNum: 19)
        } else if anim.valueForKey("id")!.isEqual("anim19") {
            drawAnotherLine(allUIViews[story.theProcess[38]][story.theProcess[39]], lineNum: 20)
        } else if anim.valueForKey("id")!.isEqual("anim20") {
            drawAnotherLine(allUIViews[story.theProcess[40]][story.theProcess[41]], lineNum: 21)
        }
    }
}
