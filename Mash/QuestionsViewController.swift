//
//  QuestionsViewController.swift
//  Mash
//
//  Created by Daniel Dickson on 6/29/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var fourthAnswerTextField: UITextField!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var mashStackView: UIStackView!
    @IBOutlet weak var animatedUIView: UIView!
    @IBOutlet var bothArrowsUIView: UIView!
    @IBOutlet var leftArrowUIView: UIView!
    @IBOutlet var rightArrowUIView: UIView!
    @IBOutlet var thirdTextBothArrowsUIView: UIView!
    @IBOutlet weak var fourthLeftAnimatedUIView: UIView!
    @IBOutlet weak var fourthRightAnimatedUIView: UIView!
    @IBOutlet weak var firstRightAnimatedUIView: UIView!
    @IBOutlet weak var firstLeftAnimatedUIView: UIView!
    @IBOutlet weak var secondLeftAnimatedUIView: UIView!
    @IBOutlet weak var secondRightAnimatedUIView: UIView!
    @IBOutlet weak var thirdLeftAnimatedUIView: UIView!
    @IBOutlet weak var thirdRightAnimatedUIView: UIView!
    
    @IBOutlet weak var cancelButtonTopConstraint: NSLayoutConstraint!
    
    var questionNumber = 0
    var mash: Mash?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(QuestionsViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(QuestionsViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        firstAnswerTextField.addTarget(self, action: #selector(QuestionsViewController.textFieldDidChange), forControlEvents: UIControlEvents.EditingChanged)
        secondAnswerTextField.addTarget(self, action: #selector(QuestionsViewController.textFieldDidChange), forControlEvents: UIControlEvents.EditingChanged)
        thirdAnswerTextField.addTarget(self, action: #selector(QuestionsViewController.textFieldDidChange), forControlEvents: UIControlEvents.EditingChanged)
        fourthAnswerTextField.addTarget(self, action: #selector(QuestionsViewController.textFieldDidChange), forControlEvents: UIControlEvents.EditingChanged)
        
        firstAnswerTextField.delegate = self
        secondAnswerTextField.delegate = self
        thirdAnswerTextField.delegate = self
        fourthAnswerTextField.delegate = self
        
        firstAnswerTextField.inputAccessoryView = rightArrowUIView
        secondAnswerTextField.inputAccessoryView = bothArrowsUIView
        thirdAnswerTextField.inputAccessoryView = thirdTextBothArrowsUIView
        fourthAnswerTextField.inputAccessoryView = leftArrowUIView
        
        leftArrowUIView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        rightArrowUIView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        bothArrowsUIView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        thirdTextBothArrowsUIView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        firstLeftAnimatedUIView.layer.cornerRadius = 8
        firstRightAnimatedUIView.layer.cornerRadius = 8
        secondLeftAnimatedUIView.layer.cornerRadius = 8
        secondRightAnimatedUIView.layer.cornerRadius = 8
        thirdLeftAnimatedUIView.layer.cornerRadius = 8
        thirdRightAnimatedUIView.layer.cornerRadius = 8
        fourthLeftAnimatedUIView.layer.cornerRadius = 8
        fourthRightAnimatedUIView.layer.cornerRadius = 8
        
        cancelButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        previousButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        nextButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleLabel.textColor = UIColor.blackColor()
        setupTextField(firstAnswerTextField)
        setupTextField(secondAnswerTextField)
        setupTextField(thirdAnswerTextField)
        setupTextField(fourthAnswerTextField)
        updateWithView()
    }
    
    func updateWithView() {
        
        animatedUIView.backgroundColor = UIColor.whiteColor()
        animatedUIView.alpha = 1.0
        UIView.animateWithDuration(1.0) { () -> Void in
            self.animatedUIView.alpha = 0
        }
        
        if questionNumber == 5 {
            nextButton.setTitle("Done", forState: .Normal)
        } else {
            nextButton.setTitle("Next", forState: .Normal)
        }
        
        switch(questionNumber) {
        case 0:
            titleLabel.text = "Crushes:"
            previousButton.hidden = true
            previousButton.enabled = false
            break
        case 1:
            titleLabel.text = "Places:"
            previousButton.hidden = false
            previousButton.enabled = true
            setupWithEmptyTextFields()
            break
        case 2:
            titleLabel.text = "Vehicles:"
            setupWithEmptyTextFields()
            break
        case 3:
            titleLabel.text = "Careers:"
            setupWithEmptyTextFields()
            break
        case 4:
            titleLabel.text = "# of Kids:"
            setupWithEmptyTextFields()
            break
        case 5:
            titleLabel.text = "Pets:"
            setupWithEmptyTextFields()
        default:
            titleLabel.text = "Oops"
        }
        
        setTextFieldKeyboards()
        setupInputAccessoryViews()
        updateWithMash()
    }
    
    func updateMash() {
        if let mash = self.mash, first = firstAnswerTextField.text, second = secondAnswerTextField.text, third = thirdAnswerTextField.text, fourth = fourthAnswerTextField.text {
            switch(questionNumber) {
            case 0:
                mash.person1 = first
                mash.person2 = second
                mash.person3 = third
                mash.person4 = fourth
                break
            case 1:
                mash.place1 = first
                mash.place2 = second
                mash.place3 = third
                mash.place4 = fourth
                break
            case 2:
                mash.vehicle1 = first
                mash.vehicle2 = second
                mash.vehicle3 = third
                mash.vehicle4 = fourth
                break
            case 3:
                mash.career1 = first
                mash.career2 = second
                mash.career3 = third
                mash.career4 = fourth
                break
            case 4:
                mash.numOfKids1 = first
                mash.numOfKids2 = second
                mash.numOfKids3 = third
                mash.numOfKids4 = fourth
                break
            case 5:
                mash.pet1 = first
                mash.pet2 = second
                mash.pet3 = third
                mash.pet4 = fourth
                break
            default:
                print("Uh oh....")
            }
        }
    }
    
    func updateWithMash() {
        if let mash = self.mash {
            switch(questionNumber) {
            case 0:
                firstAnswerTextField.text = mash.person1
                secondAnswerTextField.text = mash.person2
                thirdAnswerTextField.text = mash.person3
                fourthAnswerTextField.text = mash.person4
                break
            case 1:
                firstAnswerTextField.text = mash.place1
                secondAnswerTextField.text = mash.place2
                thirdAnswerTextField.text = mash.place3
                fourthAnswerTextField.text = mash.place4
                break
            case 2:
                firstAnswerTextField.text = mash.vehicle1
                secondAnswerTextField.text = mash.vehicle2
                thirdAnswerTextField.text = mash.vehicle3
                fourthAnswerTextField.text = mash.vehicle4
                break
            case 3:
                firstAnswerTextField.text = mash.career1
                secondAnswerTextField.text = mash.career2
                thirdAnswerTextField.text = mash.career3
                fourthAnswerTextField.text = mash.career4
                break
            case 4:
                firstAnswerTextField.text = mash.numOfKids1
                secondAnswerTextField.text = mash.numOfKids2
                thirdAnswerTextField.text = mash.numOfKids3
                fourthAnswerTextField.text = mash.numOfKids4
                break
            case 5:
                firstAnswerTextField.text = mash.pet1
                secondAnswerTextField.text = mash.pet2
                thirdAnswerTextField.text = mash.pet3
                fourthAnswerTextField.text = mash.pet4
                break
            default:
                print("Uh oh....")
            }
        }
        updateNextButton()
    }
    
    func setupTextField(textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 6
        textField.layer.borderColor = UIColor.blackColor().CGColor
        textField.backgroundColor = UIColor.whiteColor()
        textField.textColor = UIColor.blackColor()
    }
    
    func setupInputAccessoryViews() {
        firstLeftAnimatedUIView.backgroundColor = UIColor.blackColor()
        firstRightAnimatedUIView.backgroundColor = UIColor.blackColor()
        secondLeftAnimatedUIView.backgroundColor = UIColor.blackColor()
        secondRightAnimatedUIView.backgroundColor = UIColor.blackColor()
        thirdLeftAnimatedUIView.backgroundColor = UIColor.blackColor()
        thirdRightAnimatedUIView.backgroundColor = UIColor.blackColor()
        fourthLeftAnimatedUIView.backgroundColor = UIColor.blackColor()
        fourthRightAnimatedUIView.backgroundColor = UIColor.blackColor()
        firstLeftAnimatedUIView.alpha = 0
        firstRightAnimatedUIView.alpha = 0
        secondLeftAnimatedUIView.alpha = 0
        secondRightAnimatedUIView.alpha = 0
        thirdLeftAnimatedUIView.alpha = 0
        thirdRightAnimatedUIView.alpha = 0
        fourthLeftAnimatedUIView.alpha = 0
        fourthRightAnimatedUIView.alpha = 0
    }
    
    func setTextFieldKeyboards() {
        switch questionNumber {
        case 4:
            firstAnswerTextField.keyboardType = .NumberPad
            secondAnswerTextField.keyboardType = .NumberPad
            thirdAnswerTextField.keyboardType = .NumberPad
            fourthAnswerTextField.keyboardType = .NumberPad
            break
        default:
            firstAnswerTextField.keyboardType = .Default
            secondAnswerTextField.keyboardType = .Default
            thirdAnswerTextField.keyboardType = .Default
            fourthAnswerTextField.keyboardType = .Default
        }
    }
    
    func setupWithEmptyTextFields() {
        firstAnswerTextField.text = ""
        secondAnswerTextField.text = ""
        thirdAnswerTextField.text = ""
        fourthAnswerTextField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChange() {
        updateNextButton()
    }
        
    func keyboardWillShow(notification: NSNotification) {
        if self.cancelButtonTopConstraint.constant == 8{
            let basicAnimation = CABasicAnimation()
            basicAnimation.keyPath = "position.y"
            basicAnimation.fromValue = self.view.center.y
            basicAnimation.toValue = self.view.center.y - 20
            basicAnimation.duration = 0.5
            
            self.view.layer.addAnimation(basicAnimation, forKey: "launch")
            self.view.center.y -= 20
            self.cancelButtonTopConstraint.constant = -90
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.cancelButtonTopConstraint.constant != 0{
            let basicAnimation = CABasicAnimation()
            basicAnimation.keyPath = "position.y"
            basicAnimation.fromValue = self.view.center.y
            basicAnimation.toValue = self.view.center.y + 20
            basicAnimation.duration = 0.5
            
            self.view.layer.addAnimation(basicAnimation, forKey: "launch")
            self.view.center.y += 20
            self.cancelButtonTopConstraint.constant = 8
        }
    }
    
    func updateNextButton() {
        if firstAnswerTextField.text != "" && secondAnswerTextField.text != "" && thirdAnswerTextField.text != "" && fourthAnswerTextField.text != "" {
            nextButton.enabled = true
            nextButton.alpha = 1
        } else {
            nextButton.enabled = false
            nextButton.alpha = 0.5
        }
    }
    
    @IBAction func previousButtonTapped(sender: AnyObject) {
        updateMash()
        questionNumber -= 1
        updateWithView()
        firstAnswerTextField.resignFirstResponder()
        secondAnswerTextField.resignFirstResponder()
        thirdAnswerTextField.resignFirstResponder()
        fourthAnswerTextField.resignFirstResponder()
    }
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        updateMash()
        if questionNumber == 5 {
            MashController.sharedController.saveToPersistence()
            performSegueWithIdentifier("toResults", sender: self)
        } else {
            questionNumber += 1
            updateWithView()
        }
        firstAnswerTextField.resignFirstResponder()
        secondAnswerTextField.resignFirstResponder()
        thirdAnswerTextField.resignFirstResponder()
        fourthAnswerTextField.resignFirstResponder()
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        if let mash = self.mash {
            MashController.sharedController.removeMash(mash)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue) {
        if let _ = unwindSegue.sourceViewController as? ResultsViewController {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toResults" {
            let resultsViewController = segue.destinationViewController as! ResultsViewController
            resultsViewController.mash = self.mash
        }
    }
}

extension QuestionsViewController {
    
    // Take care of all the inputAccessoryView arrow actions
    
    @IBAction func fourthTextLeftArrowTapped(sender: AnyObject) {
        setupInputAccessoryViews()
        thirdLeftAnimatedUIView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.thirdLeftAnimatedUIView.alpha = 0
        }
        thirdAnswerTextField.becomeFirstResponder()
    }
    
    @IBAction func firstTextRightArrowTapped(sender: AnyObject) {
        setupInputAccessoryViews()
        secondRightAnimatedUIView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.secondRightAnimatedUIView.alpha = 0
        }
        secondAnswerTextField.becomeFirstResponder()
    }
    
    @IBAction func secondTextLeftArrowTapped(sender: AnyObject) {
        setupInputAccessoryViews()
        firstLeftAnimatedUIView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.firstLeftAnimatedUIView.alpha = 0
        }
        firstAnswerTextField.becomeFirstResponder()
    }
    
    @IBAction func secondTextRightArrowTapped(sender: AnyObject) {
        setupInputAccessoryViews()
        thirdRightAnimatedUIView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.thirdRightAnimatedUIView.alpha = 0
        }
        thirdAnswerTextField.becomeFirstResponder()
    }
    
    @IBAction func thirdTextLeftArrowTapped(sender: AnyObject) {
        setupInputAccessoryViews()
        secondLeftAnimatedUIView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.secondLeftAnimatedUIView.alpha = 0
        }
        secondAnswerTextField.becomeFirstResponder()
    }
    
    @IBAction func thirdTextRightArrowTapped(sender: AnyObject) {
        setupInputAccessoryViews()
        fourthRightAnimatedUIView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            self.fourthRightAnimatedUIView.alpha = 0
        }
        fourthAnswerTextField.becomeFirstResponder()
    }
}
