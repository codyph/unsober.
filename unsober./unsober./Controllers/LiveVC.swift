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
    
    
    
    // Outlets
    @IBOutlet weak var fullView: UIView!
    @IBOutlet weak var childView: UIView!
    
    @IBOutlet weak var endSessionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var endSessionBotConstraint: NSLayoutConstraint!
    @IBOutlet weak var fullViewBotConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullViewBotConstraint.constant += endSessionViewHeight.constant
        endSessionBotConstraint.constant = -endSessionViewHeight.constant
    }
    
    
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
        let duration = 0.4
        UIView.animate(withDuration: duration) {
            self.moveViews(sender: sender, fullView: self.fullView, childView: self.childView)
        }
    }
    
    
    func moveViews(sender: UISwipeGestureRecognizer, fullView: UIView, childView: UIView) {
        if sender.direction == UISwipeGestureRecognizer.Direction.up {
            fullView.center.y -= endSessionViewHeight.constant
            childView.center.y -= endSessionViewHeight.constant
        }
        if sender.direction == UISwipeGestureRecognizer.Direction.down {
            fullView.center.y += endSessionViewHeight.constant
            childView.center.y += endSessionViewHeight.constant
        }
    }
    
    @IBAction func endSessionBtnTapped(_ sender: Any) {
        
        // CHANGE THIS BECAUSE YOURE TAKING UP SO MUCH MEMORY
        // CHANGE AS IN : FIGURE OUT HOW TO GO BACK VIEW CONTROLLERS - STOP
        // PUSHING TO ANOTHER VIEW CONTROLLLER. YOU ESSENTIALLY NEVER CLOSE ANY
        // VIEW CONTROLLER AND ITS BAD!!!!
        
    }
    

}
