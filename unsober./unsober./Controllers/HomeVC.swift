//
//  HomeVC.swift
//  unsober.
//
//  Created by Cody Philipp on 23/6/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    // Variables
    var larryImages: [UIImage?] = [
        UIImage(named: "larry1.png"),
        UIImage(named: "larry2.png"),
        UIImage(named: "larry3.jng"),
        UIImage(named: "larry4.png"),
        UIImage(named: "larry5.jpg"),
        UIImage(named: "larry6.jpg")
    ]
    
    // Outlets
    @IBOutlet weak var larryImgView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        let randomInt = Int.random(in: 0...4)
        larryImgView.image = larryImages[randomInt]!
    }
    

}
