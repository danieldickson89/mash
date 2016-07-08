//
//  MenuViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

// A delay function
func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

class MenuViewController: UIViewController {
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var aImageView: UIImageView!
    @IBOutlet weak var sImageView: UIImageView!
    @IBOutlet weak var hImageView: UIImageView!
    @IBOutlet weak var mashImageView: UIImageView!
    @IBOutlet weak var mashGroundImageView: UIImageView!
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var cloudImageView: UIImageView!
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var savedStoriesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newGameButton.layer.cornerRadius = 6.0
        newGameButton.tintColor = UIColor.whiteColor()
        savedStoriesButton.layer.cornerRadius = 6.0
        savedStoriesButton.tintColor = UIColor.whiteColor()
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func drawRect(rect: CGRect) {
        let path: UIBezierPath = UIBezierPath()
        path.moveToPoint(CGPointMake(10.0, 10.0))
        path.addLineToPoint(CGPointMake(100.0, 100.0))
        path.lineWidth = 3
        UIColor.blueColor().setStroke()
        path.stroke()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        UIApplication.sharedApplication().statusBarStyle = .Default
        
        mashImageView.animationImages = [UIImage(named: "Mansion")!, UIImage(named: "Apartment")!, UIImage(named: "Shack")!, UIImage(named: "House")!]
        mashImageView.animationDuration = 8
        mashImageView.animationRepeatCount = Int.max
        mashImageView.startAnimating()
        mashGroundImageView.animationImages = [UIImage(named: "MansionGround")!, UIImage(named: "ApartmentGround")!, UIImage(named: "ShackGround")!, UIImage(named: "HouseGround")!]
        mashGroundImageView.animationDuration = 8
        mashGroundImageView.animationRepeatCount = Int.max
        mashGroundImageView.startAnimating()
        
        
        
        let shakeAnimation = CAKeyframeAnimation()
        shakeAnimation.keyPath = "position.x"
        shakeAnimation.values = [0, 40, -120, 40, 0]
        shakeAnimation.keyTimes = [0, 1/6.0, 3/6.0, 5/6.0, 1.0]
        shakeAnimation.duration = 10.0
        shakeAnimation.additive = true
        shakeAnimation.repeatCount = Float.infinity
        cloudImageView.layer.addAnimation(shakeAnimation, forKey: "shake")
        
        let boundRect = CGRectMake(-20, -20, 20, 20)
        let orbitAnimation = CAKeyframeAnimation()
        orbitAnimation.keyPath = "position"
        orbitAnimation.path = CGPathCreateWithEllipseInRect(boundRect, nil)
        orbitAnimation.duration = 10.0
        orbitAnimation.additive = true
        orbitAnimation.repeatCount = Float.infinity
        orbitAnimation.calculationMode = kCAAnimationPaced
        orbitAnimation.rotationMode = kCAAnimationRotateAuto
        sunImageView.layer.addAnimation(orbitAnimation, forKey: "orbit")
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
