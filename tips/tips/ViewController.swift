//
//  ViewController.swift
//  tips
//
//  Created by Jeremiah Currier on 2/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        // billAmount syntax obtained from http://vimeo.com/102084767 comment from Vijay
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * 0.2
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

}

