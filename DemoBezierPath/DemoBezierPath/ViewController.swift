//
//  ViewController.swift
//  DemoBezierPath
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/30/17.
//  Copyright © 2017 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exiFloorPlanView = EXIFloorPlanView(frame: self.view.frame)
        
        
        
        self.view.addSubview(exiFloorPlanView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

