//
//  AddDrinkPopUpVC.swift
//  unsober.
//
//  Created by Cody Philipp on 7/7/19.
//  Copyright © 2019 Cody Philipp. All rights reserved.
//

import UIKit

class AddDrinkPopUpVC: UIViewController {

    // Variables
    var standardDrinks: Double = 0.0
    
    // Outlets
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var drinkSizeTxtField: UITextField!
    @IBOutlet weak var drinkStrengthTxtField: UITextField!
    @IBOutlet weak var drinkStandardTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 25
        popUpView.layer.masksToBounds = true
        
        
    }
    
    @IBAction func addDrinkBtnTapped(_ sender: Any) {
        
        if let drnkStandard = Double(drinkStandardTxtField.text!) {
            if drnkStandard >= 0 {
                standardDrinks = drnkStandard
            }
        } else {
            print("Error in Standard Drinks")
        }
        
        if let drnkSize = Double(drinkSizeTxtField.text!) {
            if let drnkStrength = Double(drinkStrengthTxtField.text!) {
                if drnkSize >= 0 && drnkStrength >= 0 && drnkStrength <= 100 {
                    standardDrinks = calculateStandardDrinks(drinkSize: drnkSize, drinkStength: drnkStrength, countryStandard: 10.0)
                    
                } else {
                    print("Need to enter appropriate values")
                }
            } else {
                print("Error with Drink Strength")
            }
        } else {
            print("Error with Drink Size")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! LiveVC
//    }
    
    func calculateStandardDrinks(drinkSize: Double, drinkStength: Double, countryStandard: Double) -> Double {
        /*
         Size x Strength x 0.79 = grams of alcohol
         Grams of alcohol / standard drink eq for that country = no. of stdd drinks
         
         COUNTRY STANDARDS:
         Aus/NZ : 10
         UK : 8
         USA : 14
         Canada : 13.6
         Japan : 19.75
         */
        return (drinkSize * (drinkStength/100) * 0.79)/countryStandard
    }
    
}
