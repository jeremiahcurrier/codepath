//
//  ViewController.swift
//  tips
//
//  Created by Jeremiah Currier on 2/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // configure labels - proof things can be set        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("User editing bill")
        
        var tipPercentages = [0.18, 0.2, 0.22] // ALL tip percentages
        // If I wanted an individual tip percentage:
//        tipPercentages[0] = 0.18
//        tipPercentages[1] = 0.2
//        tipPercentages[2] = 0.22
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex] // ONLY SELECTED tip percentages
        
        // billAmount syntax obtained from http://vimeo.com/102084767 comment from Vijay
        var billAmount = (billField.text as NSString).doubleValue
//        var tip = billAmount * 0.2
        var tip = billAmount * tipPercentage // Replacing hard coded 0.2 value with tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        // 1st version with too many zeros right of decimal
//        tipLabel.text = String(format: "$%f", tip)
//        totalLabel.text = String(format: "$%f", total)
        
        // 2nd version with only two zeros right of decimal
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

