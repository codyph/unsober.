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
    
    var bacNumberArrayTest = [0.021,0.0157,0.01039,0.031,0.0034,0.0057] //Tester
    
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
        
        soberCheck()
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
        dismiss(animated: true, completion: nil)
    }
    
    
    func soberCheck() {
        if bloodAlcoholContent > 0.00 {
            bacTextField.text = String(format: "%.4f", bloodAlcoholContent)
            timeTextField.text = calculateTimeUntilSober(bacNum: bloodAlcoholContent)
        } else {
            bacTextField.text = "You're Sober!" // Should I include a gallery of "sayings" that could be put here? As in, every time you visit the page, there's a different greeting //
            timeTextField.text = "Time to start drinking?" // Maybe also include above idea here too???
        }
    }
    
    @IBAction func unwindFromAddDrinkPopUpVC(_ sender: UIStoryboardSegue) {
        if sender.source is AddDrinkPopUpVC {
            if let addDrinkPopupVC = sender.source as? AddDrinkPopUpVC {
                standardDrinksConsumed += addDrinkPopupVC.standardDrinks
            }
        }
        print(standardDrinksConsumed)
    }
    
    
    
    func calculateBAC() {
        /*
         0.806 = body water in blood constant (80.6%)
         SD = standard drinks
         1.2 = public health conversion constand
         BW = body water const ->   males = 0.58
                                    females = 0.49
         WT = body weight
         MR = metabolism const ->   males = 0.015
                                    females = 0.017
         DP = drinking period
         
         equation:
         
         eBAC = ((0.806 * SD * 1.2) / (BW * WT)) - MR * DP
         */
        
    }
    
    func runTimer(){
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(), userInfo: nil, repeats: true)
    }
    
    
    
    
    // FUNC JUST TO DISPLAY DATA AND SHIT FOR TESTING
    func calculateTimeUntilSober(bacNum: Double) -> String {
        var timeStatement = [String]()
        
        let timeTest = bacNum*100
        let timeHour = String(format: "%.0f", timeTest)
        
        let timeMinuteDecimal = timeTest - floor(timeTest)
        let timeMinuteN = timeMinuteDecimal*60
        let timeMinute = String(format: "%.0f", timeMinuteN)
        
        let timeSecondDecimal = timeMinuteN - floor(timeMinuteN)
        let timeSecondN = timeSecondDecimal*60
        let timeSecond = String(format: "%.0f", timeSecondN)
        
        if timeHour != "0" {
            timeStatement.append(timeHour+" hours")
        }
        if timeMinute != "0" {
            timeStatement.append(timeMinute+" mins")
        }
        if timeSecond != "0" {
            timeStatement.append(timeSecond+" secs")
        }
        
        return timeStatement.joined(separator: ", ")
    }
    
    
    
    @IBAction func greenAddBtnTappedTest(_ sender: Any) {
        bloodAlcoholContent += bacNumberArrayTest.max()!
        soberCheck()
    }
    @IBAction func greenAddBtnTapped2(_ sender: Any) {
        bloodAlcoholContent += bacNumberArrayTest.min()!
        soberCheck()
    }
    
    
}
