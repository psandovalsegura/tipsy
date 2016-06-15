//
//  SettingsViewController.swift
//  tipsy
//
//  Created by Pedro Sandoval Segura on 6/14/16.
//  Copyright © 2016 Pedro Sandoval Segura. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var centerTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTapSettings(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let leftInput = Double(leftTextField.text!) ?? nil
        let centerInput = Double(centerTextField.text!) ?? nil
        let rightInput = Double(rightTextField.text!) ?? nil
        
        //Send Data
        (segue.destinationViewController as! ViewController).leftPercent = leftInput
        (segue.destinationViewController as! ViewController).centerPercent = centerInput
        (segue.destinationViewController as! ViewController).rightPercent = rightInput
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
