//
//  ViewController.swift
//  Tictactoe
//
//  Created by Apple on 11/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeplayer = 1
    var gamestate = [0,0,0,0,0,0,0,0,0]
    let winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameisactive = true

    @IBOutlet weak var playagainButton: UIButton!
    
    @IBOutlet weak var resultlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultlbl.isHidden = true
        playagainButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func Action(_ sender: UIButton) {
        
        if gamestate[sender.tag-1] == 0 && gameisactive == true{
            gamestate[sender.tag-1] = activeplayer
        
        if activeplayer == 1 {
            
            sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
            activeplayer = 2
        }
        else{
            sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
            activeplayer = 1
        }
    }
        for combination in winningcombinations{
            
            if gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]] {
                
                gameisactive = false
                
                if gamestate[combination[0]] == 1{
                    
                    resultlbl.text = "CROSS HAS WON THE MATCH"
                    

                       }
                else{
                    
                    resultlbl.text  = "NOUGHT HAS WON THE MATCH"

                }
                
                playagainButton.isHidden = false
                resultlbl.isHidden = false

            }

        }
        
       gameisactive = false
        
        for i in gamestate{
            
            if i == 0{
                gameisactive = true
                break
            }
        }
        
        if gameisactive == false {
            resultlbl.text = "MATCH DRAW!"
            resultlbl.isHidden = false
            playagainButton.isHidden = false
        }
    }

    @IBAction func playagain(_ sender: UIButton) {
        
        gamestate = [0,0,0,0,0,0,0,0,0]
        gameisactive = true
        activeplayer = 1
        playagainButton.isHidden = true
        resultlbl.isHidden = true
        
        for i in 1...9{
            
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
}

