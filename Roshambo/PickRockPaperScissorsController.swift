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
    
    @IBOutlet weak var result: UILabel!
    
    var player1: String
    
    @IBAction func pickRock() {
        player1 = "rock"
        decideWinner()
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
        let player2 = getRoShamBoRandom()
        var victoryMessage = "And the winner is..."
        var victoryImage = "ItsATie.png"
        
        if player1 == player2 {
            victoryMessage = "It's a tie"
            victoryImage = "ItsATie.png"
        } else if player1 == "rock" && player2 == "scissors" {
            victoryMessage = "Player 1 Wins"
            victoryImage = "RockCrushesScissors.jpeg"
        } else if player1 == "rock" && player2 == "paper" {
            victoryMessage = "Player 2 Wins"
            victoryImage = "PaperCoversRock.jpg"
        } else if player1 == "paper" && player2 == "rock" {
            victoryMessage = "Player 1 Wins"
            victoryImage = "PaperCoversRock.jpg"
        } else if player1 == "paper" && player2 == "scissors" {
            victoryMessage = "Player 2 Wins"
            victoryImage = "ScissorsCutPaper.jpg"
        } else if player1 == "scissors" && player2 == "rock" {
            victoryMessage = "Player 2 Wins"
            victoryImage = "RockCrushesScissors.jpeg"
        } else if player1 == "scissors" && player2 == "paper" {
            victoryMessage = "Player 1 Wins"
            victoryImage = "ScissorsCutPaper.jpg"
        }
        self.result.text = victoryMessage
    }
    
    

}

