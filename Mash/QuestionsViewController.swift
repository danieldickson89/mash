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
    
    @IBOutlet weak var cancelButtonTopConstraint: NSLayoutConstraint!
    
    var questionNumber = 0
    var mash: Mash?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(QuestionsViewController.keyboardDidHide(_:)), name: UIKeyboardDidHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(QuestionsViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(QuestionsViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        firstAnswerTextField.delegate = self
        secondAnswerTextField.delegate = self
        thirdAnswerTextField.delegate = self
        fourthAnswerTextField.delegate = self
        
        view.backgroundColor = UIColor.whiteColor()
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
            titleLabel.text = "People:"
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
            titleLabel.text = "Number of Kids:"
            setupWithEmptyTextFields()
            break
        case 5:
            titleLabel.text = "Pets:"
            setupWithEmptyTextFields()
        default:
            titleLabel.text = "Oops"
        }
        updateWithMash()
        //firstAnswerTextField.becomeFirstResponder()
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
        textField.layer.borderColor = UIColor.blueColor().CGColor
        textField.backgroundColor = UIColor.whiteColor()
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
    
    func keyboardDidHide(notification: NSNotification) {
        updateNextButton()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.cancelButtonTopConstraint.constant == 0{
            let basicAnimation = CABasicAnimation()
            basicAnimation.keyPath = "position.y"
            basicAnimation.fromValue = self.view.center.y
            basicAnimation.toValue = self.view.center.y - 20
            basicAnimation.duration = 0.5
            
            self.view.layer.addAnimation(basicAnimation, forKey: "launch")
            self.view.center.y -= 20
            self.cancelButtonTopConstraint.constant = -80
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
            self.cancelButtonTopConstraint.constant = 0
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
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "toResults" {
//            let resultsViewController = segue.destinationViewController as! ResultsViewController
//            resultsViewController.mash = self.mash
//        }
//    }
}
