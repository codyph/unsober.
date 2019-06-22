//
//  MainVC.swift
//  unsober.
//
//  Created by Cody Philipp on 23/6/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // Variables
    var homeBtn: UIViewController!
    var larryBtn: UIViewController!
    var dataBtn: UIViewController!
    var settingsBtn: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    var segments: [UIButton] = []
    
    // Outlets
    @IBOutlet weak var btnTappedView: UIView!
    @IBOutlet weak var toolBar: CustomSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeBtn = storyboard.instantiateViewController(withIdentifier: "Home")
        larryBtn = storyboard.instantiateViewController(withIdentifier: "Larry")
        dataBtn = storyboard.instantiateViewController(withIdentifier: "Data")
        settingsBtn = storyboard.instantiateViewController(withIdentifier: "Settings")
        
        viewControllers = [homeBtn, larryBtn, dataBtn, settingsBtn]
        
        btnTapped(toolBar)
        
    }

    @IBAction func btnTapped(_ sender: CustomSegmentedControl) {
        let previousIndex = selectedIndex
        selectedIndex = sender.selectedSegmentIndex
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        btnTappedView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
}
