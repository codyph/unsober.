//
//  LiveVC.swift
//  unsober.
//
//  Created by Cody Philipp on 23/6/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit

class LiveVC: UIViewController {

    // Variables
    var swipeMoved: Int = 0
    
    var standardDrinksConsumed: Double = 0.0
    var bloodAlcoholContent: Double = 0.00
    
    var timer = Timer()
    var time: Int = 0
    var isTiming: Bool = false
    var timeUntilSober: Double = 0.0 // in Hours
    
    var bodyWeightInkG: Double = 65 // test
    //FIGURE OUT A BETTER STORAGE FOR THIS INFO -> BIOMETRICS PAGE ACCESS MAYBE
    var bodyWaterGender = ["male" : 0.58, "female" : 0.49]
    var metabolismGender = ["male" : 0.015, "female" : 0.017]
    
    // Outlets
    @IBOutlet weak var fullView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var bacView: UIView!
    
    @IBOutlet weak var bacTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var endSessionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var endSessionBotConstraint: NSLayoutConstraint!
    @IBOutlet weak var fullViewBotConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bacView.layer.cornerRadius = 20
        fullViewBotConstraint.constant += endSessionViewHeight.constant
        endSessionBotConstraint.constant = -endSessionViewHeight.constant
        bacTextField.text = "You're Sober!"
        timeTextField.text = "Time to Drink!"
    }
    
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
        let duration = 0.4
        UIView.animate(withDuration: duration) {
            self.moveViews(sender: sender, fullView: self.fullView, childView: self.childView)
        }
    }
    
    
    func moveViews(sender: UISwipeGestureRecognizer, fullView: UIView, childView: UIView) {
        if sender.direction == UISwipeGestureRecognizer.Direction.up && swipeMoved == 0 {
            fullView.center.y -= endSessionViewHeight.constant
            childView.center.y -= endSessionViewHeight.constant
            swipeMoved = 1
        }
        if sender.direction == UISwipeGestureRecognizer.Direction.down && swipeMoved == 1{
            fullView.center.y += endSessionViewHeight.constant
            childView.center.y += endSessionViewHeight.constant
            swipeMoved = 0
        }
    }
    
    @IBAction func endSessionBtnTapped(_ sender: Any) {
        stopTimer()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindFromAddDrinkPopUpVC(_ sender: UIStoryboardSegue) {
        if sender.source is AddDrinkPopUpVC {
            if let addDrinkPopupVC = sender.source as? AddDrinkPopUpVC {
                    standardDrinksConsumed += addDrinkPopupVC.standardDrinks
                    updateValues()
            }
        }
    }
    
    func updateValues() {
        if isTiming {
        } else {
            startTimer()
            isTiming = true
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in self.codeToTime()})
    }
    
    func stopTimer(){
        timer.invalidate()
        isTiming = false
        time = 0
    }
    
    func codeToTime() {
        time += 1
        calculateBloodAlcoholContent()
        calculateTimeUntilSober()
        updateTextViews()
    }
    
    func calculateBloodAlcoholContent(){
        let bloodAlcoholContentZero = (0.806*standardDrinksConsumed*1.2)/(bodyWeightInkG*bodyWaterGender["male"]!)
        let MetabolismTime = metabolismGender["male"]!*(Double(time)/3600)
        bloodAlcoholContent = (bloodAlcoholContentZero - MetabolismTime)
    }
    
    func calculateTimeUntilSober(){
        timeUntilSober = bloodAlcoholContent/(metabolismGender["male"]!)
    }
    
    
    func updateTextViews(){
        let timeInSeconds = Int(timeUntilSober * 3600)
        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds % 3600) / 60
        let seconds = timeInSeconds % 60
        
        bacTextField.text = String(format: "%0.4f", bloodAlcoholContent)
        timeTextField.text = String("\(hours) hours, \(minutes) minutes, \(seconds) seconds")
        //timeTextField.text = String(format: "%i:%02i:%02i", hours, minutes, seconds)
        
        // DECIDE HOW WE WANT TO DISPLAY TIME
    }
    
    /*
     QUICK CHECKLIST:
     FIX KEYBOARD WHEN TYPING IN ADDDRINKPOPUPVC
     FIX PRESSING ADD DRINK WITH NO DRINKS INSIDE AND IT STARTS TIMER
     MAKE TIMER CONSTRAINTS
     IF BAC GOES <= 0 -> GET TEXT FIELDS READY (SOBERCHECK) AND RESET TIMER?
     HOW DO WE GET DATA FROM ALL OF THIS
     WILL I NEED TO CHANGE TIME TO REAL TIME FOR CHARTS?
    */
    
    @IBAction func greenAddBtnTappedTest(_ sender: Any) {
        standardDrinksConsumed += 1
        updateValues()
    }
    @IBAction func greenAddBtnTapped2(_ sender: Any) {
        standardDrinksConsumed += 2
        updateValues()
    }
    
    
}
