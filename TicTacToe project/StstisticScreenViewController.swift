//
//  StstisticScreenViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 28/12/2019.
//  Copyright © 2019 MacOS Mojave. All rights reserved.
//

import UIKit

class StstisticScreenViewController: UIViewController
{

    @IBOutlet weak var stat1: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBAction func checkClick(_ sender: UIButton)
    {
        model.checkPoints()
    }
    
    
    @IBAction func resetClick(_ sender: UIButton)
    {
        model.resetPoints()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        StatCtrl = self
        
        checkButton.layer.cornerRadius = 20
        resetButton.layer.cornerRadius = 20
    }

        
}
    




