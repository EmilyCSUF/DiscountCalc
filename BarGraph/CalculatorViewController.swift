//
//  ViewController.swift
//  BarGraph
//
//  Created by Emily Michelle Lin on 3/6/17.
//  Copyright © 2017 Emily Michelle Lin. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DollarOffLabel: UILabel!
    @IBOutlet weak var DiscountLabel: UILabel!
    @IBOutlet weak var OtherDiscountLabel: UILabel!
    @IBOutlet weak var TaxLabel: UILabel!
    @IBOutlet weak var OriginalPrice: UILabel!
    @IBOutlet weak var DiscountPrice: UILabel!
    @IBOutlet weak var PriceInput: UITextField!
    @IBOutlet weak var DollarOInput: UITextField!
    @IBOutlet weak var DiscountInput: UITextField!
    @IBOutlet weak var ODiscountInput: UITextField!
    @IBOutlet weak var taxInput: UITextField!

    
    @IBAction func Calculate(_ sender: AnyObject) {
        let price = Double(PriceInput.text!)!
        let dollaroff = Double(DollarOInput.text!)!
        let discountp = Double(DiscountInput.text!)!
        let otherdiscount = Double(ODiscountInput.text!)!
        let tax = Double(taxInput.text!)!
        
        let originalp: Double = price + price * tax * 0.01;
        OriginalPrice.text = "Original Price: $\(originalp)"
        
        let firstdiscount: Double = price * discountp * 0.01
        let seconddiscount: Double = price * otherdiscount * 0.01
        let discountprice: Double = originalp - firstdiscount - seconddiscount - dollaroff
        
        DiscountPrice.text = "Discount Price: $\(discountprice)"
        
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target:self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //swipe function
    func handleSwipe(_ sender: UIGestureRecognizer)
    {
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    //enable unwinding other views
    @IBAction func unwindToCalc(segue: UIStoryboardSegue)
    {
        
    }

}

