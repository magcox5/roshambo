//
//  ResolveRoShamBoController.swift
//  Roshambo
//
//  Created by Molly Cox on 3/15/16.
//  Copyright © 2016 Molly Cox. All rights reserved.
//

import UIKit

class ResolveRoShamBoController: UIViewController {
  
    @IBOutlet weak var Result: UILabel?
    
    @IBOutlet weak var WinningImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.WinningImage!.alpha = 1
        }
    }
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}

