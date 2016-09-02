//
//  ResultsViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var mashLabels: [UILabel]!
    @IBOutlet var mashUIViews: [UIView]!
    @IBOutlet var titleAndUnderlineLabels: [UILabel]!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tapWhenReadyButton: UIButton!
    @IBOutlet weak var spiralImageView: UIImageView!
    @IBOutlet weak var storyLabel: UILabel!
    
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
        
        titleAndUnderlineLabels[0].adjustsFontSizeToFitWidth = true
        titleAndUnderlineLabels[0].lineBreakMode = NSLineBreakMode.ByClipping
        titleAndUnderlineLabels[2].adjustsFontSizeToFitWidth = true
        titleAndUnderlineLabels[2].lineBreakMode = NSLineBreakMode.ByClipping
        titleAndUnderlineLabels[4].adjustsFontSizeToFitWidth = true
        titleAndUnderlineLabels[4].lineBreakMode = NSLineBreakMode.ByClipping
        titleAndUnderlineLabels[6].adjustsFontSizeToFitWidth = true
        titleAndUnderlineLabels[6].lineBreakMode = NSLineBreakMode.ByClipping
        titleAndUnderlineLabels[8].adjustsFontSizeToFitWidth = true
        titleAndUnderlineLabels[8].lineBreakMode = NSLineBreakMode.ByClipping
        titleAndUnderlineLabels[10].adjustsFontSizeToFitWidth = true
        titleAndUnderlineLabels[10].lineBreakMode = NSLineBreakMode.ByClipping
        
        let story = StoryController.sharedController.getStory(randomNum)
        
        if let mash = self.mash {
            peopleArray = [mash.person1!, mash.person2!, mash.person3!, mash.person4!]
            placesArray = [mash.place1!, mash.place2!, mash.place3!, mash.place4!]
            vehiclesArray = [mash.vehicle1!, mash.vehicle2!, mash.vehicle3!, mash.vehicle4!]
            careersArray = [mash.career1!, mash.career2!, mash.career3!, mash.career4!]
            numOfKidsArray = [mash.numOfKids1!, mash.numOfKids2!, mash.numOfKids3!, mash.numOfKids4!]
            petsArray = [mash.pet1!, mash.pet2!, mash.pet3!, mash.pet4!]
            
            storyLabel.text = "You married \(peopleArray[story.results[1]]) and live happily in a \(homesArray[story.results[0]]) in \(placesArray[story.results[2]]). You drive a \(vehiclesArray[story.results[3]]) to work where you are a(n) \(careersArray[story.results[4]]), and come home each day to \(numOfKidsArray[story.results[5]]) kid(s) and a pet \(petsArray[story.results[6]])."
        }
        
        mash?.theNumber = randomNum
        MashController.sharedController.saveToPersistence()
        
        mashLabels[4].text = mash?.person1
        mashLabels[5].text = mash?.person2
        mashLabels[6].text = mash?.person3
        mashLabels[7].text = mash?.person4
        mashLabels[8].text = mash?.place1
        mashLabels[9].text = mash?.place2
        mashLabels[10].text = mash?.place3
        mashLabels[11].text = mash?.place4
        mashLabels[12].text = mash?.vehicle1
        mashLabels[13].text = mash?.vehicle2
        mashLabels[14].text = mash?.vehicle3
        mashLabels[15].text = mash?.vehicle4
        mashLabels[16].text = mash?.career1
        mashLabels[17].text = mash?.career2
        mashLabels[18].text = mash?.career3
        mashLabels[19].text = mash?.career4
        mashLabels[20].text = mash?.numOfKids1
        mashLabels[21].text = mash?.numOfKids2
        mashLabels[22].text = mash?.numOfKids3
        mashLabels[23].text = mash?.numOfKids4
        mashLabels[24].text = mash?.pet1
        mashLabels[25].text = mash?.pet2
        mashLabels[26].text = mash?.pet3
        mashLabels[27].text = mash?.pet4
        
        storyLabel.hidden = true
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
    
    @IBAction func tapWhenReadyButtonTapped(sender: AnyObject) {
        let story = StoryController.sharedController.getStory(randomNum)
        let homeUIViews = [mashUIViews[0], mashUIViews[1], mashUIViews[2], mashUIViews[3]]
        let peopleUIViews = [mashUIViews[4], mashUIViews[5], mashUIViews[6], mashUIViews[7]]
        let placeUIViews = [mashUIViews[8], mashUIViews[9], mashUIViews[10], mashUIViews[11]]
        let vehicleUIViews = [mashUIViews[12], mashUIViews[13], mashUIViews[14], mashUIViews[15]]
        let careerUIViews = [mashUIViews[16], mashUIViews[17], mashUIViews[18], mashUIViews[19]]
        let numOfKidsUIViews = [mashUIViews[20], mashUIViews[21], mashUIViews[22], mashUIViews[23]]
        let petUIViews = [mashUIViews[24], mashUIViews[25], mashUIViews[26], mashUIViews[27]]
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
        case mashUIViews[0], mashUIViews[1], mashUIViews[2], mashUIViews[3]:
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
        let homeUIViews = [mashUIViews[0], mashUIViews[1], mashUIViews[2], mashUIViews[3]]
        let peopleUIViews = [mashUIViews[4], mashUIViews[5], mashUIViews[6], mashUIViews[7]]
        let placeUIViews = [mashUIViews[8], mashUIViews[9], mashUIViews[10], mashUIViews[11]]
        let vehicleUIViews = [mashUIViews[12], mashUIViews[13], mashUIViews[14], mashUIViews[15]]
        let careerUIViews = [mashUIViews[16], mashUIViews[17], mashUIViews[18], mashUIViews[19]]
        let numOfKidsUIViews = [mashUIViews[20], mashUIViews[21], mashUIViews[22], mashUIViews[23]]
        let petUIViews = [mashUIViews[24], mashUIViews[25], mashUIViews[26], mashUIViews[27]]
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
        } else if anim.valueForKey("id")!.isEqual("anim21") {
            spiralImageView.hidden = true
            tapWhenReadyButton.hidden = true
            storyLabel.hidden = false
        }
    }
}
