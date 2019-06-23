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
    @IBOutlet var fullView: UIView!
    @IBOutlet weak var endSessionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var endSessionBotConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //endSessionViewHeight.constant = view.frame.height/5
        endSessionBotConstraint.constant = endSessionViewHeight.constant
        
    }
    
    
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
        let duration = 0.4
        UIView.animate(withDuration: duration) {
            self.moveViews(sender: sender, view: self.fullView)
        }
    }
    
    func moveViews(sender: UISwipeGestureRecognizer, view: UIView){
        if sender.direction == UISwipeGestureRecognizer.Direction.up {
            view.center.y -= endSessionViewHeight.constant
        }
        if sender.direction == UISwipeGestureRecognizer.Direction.down {
            view.center.y += endSessionViewHeight.constant
        }
    }

}
