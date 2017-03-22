//
//  ResultsViewController.swift
//  BarGraph
//
//  Created by Emily Michelle Lin on 3/6/17.
//  Copyright © 2017 Emily Michelle Lin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target:self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func handleSwipe(_ sender: UIGestureRecognizer)
    {
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
    }

}
