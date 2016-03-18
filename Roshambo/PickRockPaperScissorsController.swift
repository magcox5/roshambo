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
    
    var player1: String = ""
    var player2: String = ""
    var victoryMessage: String?
    var victoryImage: String?
    
    @IBAction func pickRock() {
        player1 = "rock"
        decideWinner()
        
        print(self.victoryImage, self.victoryMessage)
        
        let nextController = ResolveRoShamBoController()
        if let victoryMessage = self.victoryMessage {
            nextController.Result!.text = victoryMessage
        } else {
            nextController.Result = nil
        }

        if let victoryImage = self.victoryImage {
        nextController.WinningImage!.image = UIImage(named: "\(victoryImage)")
        } else {
            nextController.WinningImage = nil
        }
        
        self.presentViewController(nextController, animated:  true, completion:nil)

    }

    @IBAction func pickPaper() {
        player1 = "paper"
        decideWinner()
    }
    
    @IBAction func pickScissors() {
        player1 = "scissors"
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
            victoryMessage = "\(player1) vs. \(player2): I Win"
            victoryImage = "RockCrushesScissors.jpeg"
        case ("rock", "paper"):
            victoryMessage = "\(player1) vs. \(player2): You Win"
            victoryImage = "PaperCoversRock.jpg"
        case ("paper", "rock"):
            victoryMessage = "\(player1) vs. \(player2): I Win"
            victoryImage = "PaperCoversRock.jpg"
        case ("paper", "scissors"):
            victoryMessage = "\(player1) vs. \(player2): You Win"
            victoryImage = "ScissorsCutPaper.jpg"
        case ("scissors", "rock"):
            victoryMessage = "\(player1) vs. \(player2): You Win"
            victoryImage = "RockCrushesScissors.jpeg"
        case ("scissors", "paper"):
            victoryMessage = "\(player1) vs. \(player2): I Win"
            victoryImage = "ScissorsCutPaper.jpg"
        default:
            victoryMessage = "\(player1) vs. \(player2): It's a tie"
            victoryImage = "ItsATie.png"
        }
    }
    
    

}

