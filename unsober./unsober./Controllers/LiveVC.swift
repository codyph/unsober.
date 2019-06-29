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
    
    var bacNumber: Double = 0.00
    var bacNumberArrayTest = [0.021,0.0157,0.01039,0.031,0.0034,0.0057] //Tester
    
    // ** NEED TO CODE THAT YOU CAN ONLY SWIPE UPWARDS AND DOWNWARDS ONCE
    
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
        if bacNumber > 0.00 {
            bacTextField.text = String(format: "%.4f", bacNumber)
            timeTextField.text = calculateTimeUntilSober(bacNum: bacNumber)
        } else {
            bacTextField.text = "You're Sober!" // Should I include a gallery of "sayings" that could be put here? As in, every time you visit the page, there's a different greeting //
            timeTextField.text = "Time to start drinking?" // Maybe also include above idea here too???
        }
    }
    
    func calculateBac(){
        /*
         eBAC = (c/2 - GC/weight) - (Beta*t)
        */
    }
    
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
        bacNumber += bacNumberArrayTest.max()!
        soberCheck()
    }
    @IBAction func greenAddBtnTapped2(_ sender: Any) {
        bacNumber += bacNumberArrayTest.min()!
        soberCheck()
    }
    @IBAction func greenAddBtnTapped3(_ sender: Any) {
        bacNumber += bacNumberArrayTest.max()! - 3*bacNumberArrayTest.min()!
        soberCheck()
    }
    
    
}
