//
//  ViewController.swift
//  DemoAccessibilityCALayer
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/30/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let parentViewFrame = self.view.frame        
        let childView = CustomView(frame: parentViewFrame)
        self.view.addSubview(childView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}

