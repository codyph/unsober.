//
//  ViewController.swift
//  unsober.
//
//  Created by Cody Philipp on 6/6/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    // Variables
    
    // Outlets
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func segmentControlValueChanged(_ sender: SegmentControl) {
        sender.changeSelectedIndex(to: sender.selectedSegmentIndex)
    }
    
    
    
    
    
}

