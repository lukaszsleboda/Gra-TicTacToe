//
//  GameScreenViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 27/12/2019.
//  Copyright © 2019 MacOS Mojave. All rights reserved.
//

import UIKit


class GameScreenViewController: UIViewController {

    
    
    @IBOutlet weak var FPnameLabel: UILabel!
    @IBOutlet weak var SPnameLabel: UILabel!
    
    @IBOutlet weak var FPpointsLabel: UILabel!
    @IBOutlet weak var SPpointsLabel: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var PlayAgain: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        FPnameLabel.text = String(model.FPnameString)
        SPnameLabel.text = String(model.SPnameString)
        GSctrl = self
        
        PlayAgain.layer.cornerRadius = 20
    }

    
    
    
    @IBAction func Game(_ sender: UIButton)
    {
        model.Game(sender.tag)
        

    if (model.gameIsActive == true)
    {
        if (model.activePlayer == 1)
        {
            if model.playWithFoto2 == false
            {
                switch model.SPcolor
                {
                case #colorLiteral(red: 1, green: 0.5411368741, blue: 0.2144555707, alpha: 1):
                    sender.setImage(UIImage(named: "orangeO.JPG"), for: UIControl.State())
                    
                case #colorLiteral(red: 0.1694690646, green: 0.1674307232, blue: 0.9991181493, alpha: 1):
                    sender.setImage(UIImage(named: "blueO.JPG"), for: UIControl.State())
                    
                case #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1):
                    sender.setImage(UIImage(named: "whiteO.JPG"), for: UIControl.State())
                    
                case #colorLiteral(red: 0.1532756349, green: 0.6637386658, blue: 0, alpha: 0.8470588235):
                    sender.setImage(UIImage(named: "greenO.JPG"), for: UIControl.State())
                default:
                    sender.setImage(UIImage(named: "orangeO.JPG"), for: UIControl.State())
                }
            }
            else
            {
                sender.setImage(model.foto2, for: UIControl.State())
                sender.layer.cornerRadius = sender.frame.width / 2
                sender.layer.masksToBounds = true
            }
            
        }
            else
            {
                if model.playWithFoto1 == false
                {
                    switch model.FPcolor
                    {
                    case #colorLiteral(red: 1, green: 0.5411368741, blue: 0.2144555707, alpha: 1):
                        sender.setImage(UIImage(named: "orangeX.JPG"), for: UIControl.State())
                        
                    case #colorLiteral(red: 0.1694690646, green: 0.1674307232, blue: 0.9991181493, alpha: 1):
                        sender.setImage(UIImage(named: "blueX.JPG"), for: UIControl.State())
                        
                    case #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1):
                        sender.setImage(UIImage(named: "whiteX.JPG"), for: UIControl.State())
                        
                    case #colorLiteral(red: 0.1532756349, green: 0.6637386658, blue: 0, alpha: 0.8470588235):
                        sender.setImage(UIImage(named: "greenX.JPG"), for: UIControl.State())
                    default:
                        sender.setImage(UIImage(named: "orangeX.JPG"), for: UIControl.State())
                    }
                }
                else
                    {
                        sender.setImage(model.foto1, for: UIControl.State())
                        sender.layer.cornerRadius = sender.frame.width / 2
                        sender.layer.masksToBounds = true
                    }
            }
        }
    }
    
    @IBAction func PlayAgainClick(_ sender: UIButton)
    {
        model.SetNewGame()
    }
    
    @IBAction func backMenu(_ sender: UIButton)
    {
        model.endGame()
    }
    
    
    
    
    
}
