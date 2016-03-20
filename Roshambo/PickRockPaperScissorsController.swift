//
//  PickRockPaperScissorsController.swift
//  Roshambo
//
//  Created by Molly Cox on 3/15/16.
//  Copyright © 2016 Molly Cox. All rights reserved.
//

import UIKit
import Foundation

class PickRockPaperScissorsController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
//    var player1: String = ""
    
    @IBAction func pickRock() {
    let nextController = self.storyboard?.instantiateViewControllerWithIdentifier("ResolveRoShamBoController") as! ResolveRoShamBoController
        nextController.player1 = "rock"
        presentViewController(nextController, animated: true, completion: nil)
    }

    @IBAction func pickPaper() {
        performSegueWithIdentifier("play", sender: "paper")
    }
    
//    @IBAction func pickScissors() {
//
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let vc = segue.destinationViewController as! ResolveRoShamBoController
            vc.player1 = "paper"
        } else {
            let vc = segue.destinationViewController as! ResolveRoShamBoController
            vc.player1 = "scissors"
        }
    }
}

