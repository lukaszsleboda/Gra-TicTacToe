//
//  StartScreenViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 27/12/2019.
//  Copyright © 2019 MacOS Mojave. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController
{

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var StartButton2: UIButton!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        StartButton.layer.cornerRadius = 20
        secondButton.layer.cornerRadius = 20
        StartButton2.layer.cornerRadius = 20
    }
    
}
