//
//  ViewController.swift
//  tipsy
//
//  Created by Pedro Sandoval Segura on 6/14/16.
//  Copyright © 2016 Pedro Sandoval Segura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var settingsButton: UIButton!
    

    
    //Fields
    var leftPercent: Double?
    var centerPercent: Double?
    var rightPercent: Double?
    
    var tipPercentages = [Double]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.title = "Tip Calculator"
        print(leftPercent)
        print(tipPercentages)
        
        print("left percent value is " + String(leftPercent != nil))
        print("cetner percent value is " + String(centerPercent != nil))
        print("right percent value is " + String(rightPercent != nil))
        print("together" + String(leftPercent != nil &&  centerPercent != nil && rightPercent != nil))
        if leftPercent != nil &&  centerPercent != nil && rightPercent != nil {
            tipPercentages.append(leftPercent!)
            tipPercentages.append(centerPercent!)
            tipPercentages.append(rightPercent!)
            for index in 0 ..< tipPercentages.count {
                tipControl.setTitle(String(tipPercentages[index]) + "%", forSegmentAtIndex: index)
            }
            print("appended")
            print(tipPercentages)
        } else {
            tipPercentages = [0.18, 0.20, 0.25]
        }
        
        billField.becomeFirstResponder()
        print("new load!!!!!!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    @IBAction func update(sender: AnyObject) {
        if leftPercent != nil &&  centerPercent != nil && rightPercent != nil {
            tipPercentages.append(leftPercent!)
            tipPercentages.append(centerPercent!)
            tipPercentages.append(rightPercent!)
        } else {
            tipPercentages = [0.18, 0.20, 0.25]
        }
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        //When the user changes the bill, the tip is calculated
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
}

