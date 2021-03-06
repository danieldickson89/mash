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
    @IBOutlet weak var spacingUIView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
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
    @IBOutlet weak var stackBottomConstraint: NSLayoutConstraint!
    
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
        
        leftArrowUIView.backgroundColor = UIColor(white: 0.8, alpha: 0.25)
        rightArrowUIView.backgroundColor = UIColor(white: 0.8, alpha: 0.25)
        bothArrowsUIView.backgroundColor = UIColor(white: 0.8, alpha: 0.25)
        thirdTextBothArrowsUIView.backgroundColor = UIColor(white: 0.8, alpha: 0.25)
        firstLeftAnimatedUIView.layer.cornerRadius = 8
        firstRightAnimatedUIView.layer.cornerRadius = 8
        secondLeftAnimatedUIView.layer.cornerRadius = 8
        secondRightAnimatedUIView.layer.cornerRadius = 8
        thirdLeftAnimatedUIView.layer.cornerRadius = 8
        thirdRightAnimatedUIView.layer.cornerRadius = 8
        fourthLeftAnimatedUIView.layer.cornerRadius = 8
        fourthRightAnimatedUIView.layer.cornerRadius = 8
        
        previousButton.titleLabel?.numberOfLines = 1
        previousButton.titleLabel?.adjustsFontSizeToFitWidth = true
        previousButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByClipping
        nextButton.titleLabel?.numberOfLines = 1
        nextButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nextButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByClipping
        
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
        
        self.view.alpha = 0.5
        UIView.animateWithDuration(1.0) { () -> Void in
            self.view.alpha = 1
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
            spacingUIView.hidden = false
            previousButton.enabled = false
            break
        case 1:
            titleLabel.text = "Places:"
            previousButton.hidden = false
            spacingUIView.hidden = true
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
    
    func setTextFieldsToSavedAnswers(answer1: String?, answer2: String?, answer3: String?, answer4: String?) {
        firstAnswerTextField.text = answer1
        secondAnswerTextField.text = answer2
        thirdAnswerTextField.text = answer3
        fourthAnswerTextField.text = answer4
    }
    
    func updateWithMash() {
        if let mash = self.mash {
            switch(questionNumber) {
            case 0:
                setTextFieldsToSavedAnswers(mash.person1, answer2: mash.person2, answer3: mash.person3, answer4: mash.person4)
                break
            case 1:
                setTextFieldsToSavedAnswers(mash.place1, answer2: mash.place2, answer3: mash.place3, answer4: mash.place4)
                break
            case 2:
                setTextFieldsToSavedAnswers(mash.vehicle1, answer2: mash.vehicle2, answer3: mash.vehicle3, answer4: mash.vehicle4)
                break
            case 3:
                setTextFieldsToSavedAnswers(mash.career1, answer2: mash.career2, answer3: mash.career3, answer4: mash.career4)
                break
            case 4:
                setTextFieldsToSavedAnswers(mash.numOfKids1, answer2: mash.numOfKids2, answer3: mash.numOfKids3, answer4: mash.numOfKids4)
                break
            case 5:
                setTextFieldsToSavedAnswers(mash.pet1, answer2: mash.pet2, answer3: mash.pet3, answer4: mash.pet4)
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
        let info  = notification.userInfo!
        let value: AnyObject = info[UIKeyboardFrameEndUserInfoKey]!
        let rawFrame = value.CGRectValue
        let keyboardFrame = view.convertRect(rawFrame, fromView: nil)
        
        if self.stackBottomConstraint.constant == 0{
            let basicAnimation = CABasicAnimation()
            basicAnimation.keyPath = "position.y"
            basicAnimation.fromValue = self.view.center.y
            basicAnimation.toValue = self.view.center.y - 20
            basicAnimation.duration = 0.5
            
            self.view.layer.addAnimation(basicAnimation, forKey: "launch")
            self.view.center.y -= 20
            self.stackBottomConstraint.constant = keyboardFrame.height
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.stackBottomConstraint.constant != 0{
            let basicAnimation = CABasicAnimation()
            basicAnimation.keyPath = "position.y"
            basicAnimation.fromValue = self.view.center.y
            basicAnimation.toValue = self.view.center.y + 20
            basicAnimation.duration = 0.5
            
            self.view.layer.addAnimation(basicAnimation, forKey: "launch")
            self.view.center.y += 20
            self.stackBottomConstraint.constant = 0
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
    
    func animateArrow(uiView: UIView, textField: UITextField) {
        setupInputAccessoryViews()
        uiView.alpha = 1
        UIView.animateWithDuration(1) { () -> Void in
            uiView.alpha = 0
        }
        textField.becomeFirstResponder()
    }
    
    @IBAction func fourthTextLeftArrowTapped(sender: AnyObject) {
        animateArrow(thirdLeftAnimatedUIView, textField: thirdAnswerTextField)
    }
    
    @IBAction func firstTextRightArrowTapped(sender: AnyObject) {
        animateArrow(secondRightAnimatedUIView, textField: secondAnswerTextField)
    }
    
    @IBAction func secondTextLeftArrowTapped(sender: AnyObject) {
        animateArrow(firstLeftAnimatedUIView, textField: firstAnswerTextField)
    }
    
    @IBAction func secondTextRightArrowTapped(sender: AnyObject) {
        animateArrow(thirdRightAnimatedUIView, textField: thirdAnswerTextField)
    }
    
    @IBAction func thirdTextLeftArrowTapped(sender: AnyObject) {
        animateArrow(secondLeftAnimatedUIView, textField: secondAnswerTextField)
    }
    
    @IBAction func thirdTextRightArrowTapped(sender: AnyObject) {
        animateArrow(fourthRightAnimatedUIView, textField: fourthAnswerTextField)
    }
}
