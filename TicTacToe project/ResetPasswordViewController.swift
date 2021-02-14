//
//  ResetPasswordViewController.swift
//  TicTacToe project
//
//  Created by MacOS on 02/01/2020.
//  Copyright © 2020 MacOS Mojave. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var passwordField: UILabel!  // wyrzucam hasło
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var checkPasswordButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        RPctrl = self

        checkPasswordButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func checkPassword(_ sender: UIButton)
    {
        model.resetPassword()
    }
}
