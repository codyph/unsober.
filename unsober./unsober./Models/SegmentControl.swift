//
//  SegmentControl.swift
//  unsober.
//
//  Created by Cody Philipp on 14/6/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit


class SegmentControl: UISegmentedControl {

    // Variables
    let selectedBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    var sortedViews: [UIView]!
    var currentIndex: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        sortedViews = self.subviews.sorted(by:{$0.frame.origin.x < $1.frame.origin.x})
        changeSelectedIndex(to: currentIndex)
        self.tintColor = UIColor.init(red: 50/225, green: 50/255, blue: 50/255, alpha: 0.25)
        self.layer.cornerRadius = 0
        self.clipsToBounds = false
        let unselectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)]
        self.setTitleTextAttributes(unselectedAttributes, for: .normal)
        self.setTitleTextAttributes(unselectedAttributes, for: .selected)
    }
    
    func changeSelectedIndex(to newIndex: Int) {
        for i in 0...3 {
            sortedViews[i].backgroundColor = UIColor.init(red: 50/225, green: 50/255, blue: 50/255, alpha: 0.25)
        }
        currentIndex = newIndex
        self.selectedSegmentIndex = UISegmentedControl.noSegment
        sortedViews[currentIndex].backgroundColor = selectedBackgroundColor
    }
    

}
