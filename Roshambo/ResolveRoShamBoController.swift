//
//  ResolveRoShamBoController.swift
//  Roshambo
//
//  Created by Molly Cox on 3/15/16.
//  Copyright © 2016 Molly Cox. All rights reserved.
//

import UIKit

class ResolveRoShamBoController: UIViewController {

    var player1: String = ""
    var player2: String = ""
    
    @IBOutlet weak var Result: UILabel?
    
    @IBOutlet weak var resultImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.resultImage!.alpha = 1
        }
    }
    
    override func viewWillAppear(animated: Bool) {

        super.viewWillAppear(animated)
        
        // Winner will be decided only if player1 has been passed
        player2 = getRoShamBoRandom()
        decideWinner()
    }
    


    func getRoShamBoRandom() ->String {
        var playerChoice: String
        
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        if randomValue == 1 {
            playerChoice = "rock"
        } else if randomValue == 2 {
            playerChoice = "paper"
        } else {
            playerChoice = "scissors"
        }
        return playerChoice
    }
    
    
    func decideWinner() {
        // get opponents' choice
        player2 = getRoShamBoRandom()
        
        let game = (player1, player2)
        
        switch game {
        case ("rock", "scissors"):
            Result?.text = "\(player1) vs. \(player2): I Win"
            resultImage?.image = UIImage(named: "RockCrushesScissors.jpeg")
        case ("rock", "paper"):
            Result?.text = "\(player1) vs. \(player2): You Win"
            resultImage?.image = UIImage(named: "PaperCoversRock.jpg")
        case ("paper", "rock"):
            Result?.text = "\(player1) vs. \(player2): I Win"
            resultImage?.image = UIImage(named: "PaperCoversRock.jpg")
        case ("paper", "scissors"):
            Result?.text = "\(player1) vs. \(player2): You Win"
            resultImage?.image = UIImage(named: "ScissorsCutPaper.jpg")
        case ("scissors", "rock"):
            Result?.text = "\(player1) vs. \(player2): You Win"
            resultImage?.image = UIImage(named: "RockCrushesScissors.jpeg")
        case ("scissors", "paper"):
            Result?.text = "\(player1) vs. \(player2): I Win"
            resultImage?.image = UIImage(named: "ScissorsCutPaper.jpg")
        default:
            Result?.text = "\(player1) vs. \(player2): It's a tie"
            resultImage?.image = UIImage(named: "itsATie.png")
        }
    }
    
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}

